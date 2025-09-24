import 'dart:convert';

import 'package:flutter/material.dart';
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
