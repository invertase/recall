import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';

class TitleSection extends StatefulWidget {
  const TitleSection({
    super.key,
    required this.currentTitle,
    required this.onTitleChanged,
  });

  final String currentTitle;
  final ValueChanged<String> onTitleChanged;

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _updateControllerFromNote();
  }

  void _updateControllerFromNote() {
    final title = widget.currentTitle;
    if (_controller.text != title) {
      _controller.text = title;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = GlobeTheme.of(context).textTheme;
    final colorScheme = GlobeTheme.of(context).colorScheme;

    final isNewNote = widget.currentTitle.isEmpty;

    return Row(
      children: [
        AppIcon.edit(hasColor: false, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: textTheme.heading5?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
            onChanged: widget.onTitleChanged,
            decoration: InputDecoration(
              hintText: isNewNote ? 'Enter title' : 'Enter title...',
              hintStyle: textTheme.heading5?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
