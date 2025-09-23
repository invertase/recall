import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/presentation/notes/widgets/action_buttons.dart';
import 'package:frontend/src/presentation/notes/widgets/toolbar_and_actions.dart';

class NoteTextEditor extends StatefulWidget {
  const NoteTextEditor({
    super.key,
    required this.currentContent,
    required this.onContentChanged,
  });

  final String currentContent;
  final ValueChanged<String> onContentChanged;

  @override
  State<NoteTextEditor> createState() => _NoteTextEditorState();
}

class _NoteTextEditorState extends State<NoteTextEditor> {
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  @override
  void didUpdateWidget(NoteTextEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentContent != widget.currentContent) {
      _updateControllerFromNote();
    }
  }

  void _initializeController() {
    if (widget.currentContent.isNotEmpty) {
      try {
        final content = jsonDecode(widget.currentContent);
        _controller = QuillController(
          document: Document.fromJson(content),
          selection: const TextSelection.collapsed(offset: 0),
        );
      } catch (e) {
        _controller = QuillController.basic();
      }
    } else {
      _controller = QuillController.basic();
    }

    _controller.addListener(_onTextChanged);
  }

  void _updateControllerFromNote() {
    if (widget.currentContent.isEmpty) {
      _controller.document = Document();
      return;
    }

    try {
      final content = jsonDecode(widget.currentContent);
      final currentContent = jsonEncode(
        _controller.document.toDelta().toJson(),
      );

      if (currentContent != widget.currentContent) {
        _controller.document = Document.fromJson(content);
      }
    } catch (e) {
      _controller.document = Document();
    }
  }

  void _onTextChanged() {
    widget.onContentChanged(
      jsonEncode(_controller.document.toDelta().toJson()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: QuillEditor.basic(
            controller: _controller,
            focusNode: _focusNode,
            config: QuillEditorConfig(
              padding: EdgeInsets.zero,
              scrollable: true,
              autoFocus: false,
              expands: false,
              placeholder: 'Start typing...',
              customStyles: DefaultStyles(
                placeHolder: DefaultTextBlockStyle(
                  TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 14,
                    height: 1.4,
                  ),
                  const HorizontalSpacing(0, 0),
                  const VerticalSpacing(6, 0),
                  const VerticalSpacing(0, 0),
                  null,
                ),
              ),
              customShortcuts: {
                const SingleActivator(LogicalKeyboardKey.backspace):
                    const BackspaceListIntent(),
              },

              // ✅ Map the Intent to your new Action
              customActions: {
                BackspaceListIntent: BackspaceListAction(_controller),
              },
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            ToolBarAndActions(controller: controller),
            const Spacer(),
            const ActionButtons(),
          ],
        ),
      ],
    );
  }

  QuillController get controller => _controller;
}

// 1. Define an Intent: A command that can be invoked by a shortcut.
class BackspaceListIntent extends Intent {
  const BackspaceListIntent();
}

// 2. Define an Action: The logic that executes when the Intent is invoked.
class BackspaceListAction extends Action<BackspaceListIntent> {
  BackspaceListAction(this.controller);

  final QuillController controller;

  @override
  Object? invoke(BackspaceListIntent intent) {
    final selection = controller.selection;

    // Check if the cursor is not selecting a range of text
    if (!selection.isCollapsed) {
      // Let the default action handle range deletion
      return null;
    }

    final plainText = controller.document.toPlainText();
    final lineStartOffset =
        plainText.lastIndexOf('\n', selection.start - 1) + 1;

    // Check if the cursor is at the very beginning of the line
    if (selection.start != lineStartOffset) {
      // Not at the start of a line, let the default action handle it
      return null;
    }

    final style = controller.getSelectionStyle();
    final isList =
        style.containsKey(Attribute.ul.key) ||
        style.containsKey(Attribute.ol.key);
    print(isList);
    if (isList) {
      // It IS an empty list item, so we handle it.
      Attribute? listAttribute = style.containsKey(Attribute.ul.key)
          ? Attribute.ul
          : Attribute.ol;
      controller.formatSelection(Attribute.clone(listAttribute, null));
    } else {
      // It's NOT a list item, so we need to let the default action run.
      // Returning null allows the event to bubble up to the next handler.
      return null;
    }

    // We handled it, so return non-null to stop the event from bubbling.
    return true;
  }
}
