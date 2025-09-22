import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/presentation/notes/widgets/toolbar_button.dart';

class ToolBarAndActions extends StatelessWidget {
  const ToolBarAndActions({super.key, required this.controller});

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: colorScheme.surface,
            blurRadius: 10,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ToolBarButton(
            iconName: 'undo',
            onPressed: () => controller.undo(),
            isEnabled: controller.hasUndo,
          ),
          ToolBarButton(
            iconName: 'redo',
            onPressed: () => controller.redo(),
            isEnabled: controller.hasRedo,
          ),
          const VerticalDivider(),
          ToolBarButton(
            iconName: 'bold',
            onPressed: () => _toggleAttribute(Attribute.bold),
            isActive: _isAttributeActive(Attribute.bold),
          ),
          ToolBarButton(
            iconName: 'italics',
            onPressed: () => _toggleAttribute(Attribute.italic),
            isActive: _isAttributeActive(Attribute.italic),
          ),
          ToolBarButton(
            iconName: 'underline',
            onPressed: () => _toggleAttribute(Attribute.underline),
            isActive: _isAttributeActive(Attribute.underline),
          ),
          HeaderToolBarButton(
            controller: controller,
            toggleAttribute: _toggleAttribute,
          ),
          const VerticalDivider(),
          ToolBarButton(
            iconName: 'numbered_list',
            onPressed: () => _toggleAttribute(Attribute.ol),
            isActive: _isAttributeActive(Attribute.ol),
          ),
          ToolBarButton(
            iconName: 'bulleted_list',
            onPressed: () => _toggleAttribute(Attribute.ul),
            isActive: _isAttributeActive(Attribute.ul),
          ),
          ToolBarButton(
            iconName: 'align_left',
            onPressed: () => _toggleAttribute(Attribute.leftAlignment),
            isActive: _isAttributeActive(Attribute.leftAlignment),
          ),
          ToolBarButton(
            iconName: 'align_center',
            onPressed: () => _toggleAttribute(Attribute.centerAlignment),
            isActive: _isAttributeActive(Attribute.centerAlignment),
          ),
          ToolBarButton(
            iconName: 'align_right',
            onPressed: () => _toggleAttribute(Attribute.rightAlignment),
            isActive: _isAttributeActive(Attribute.rightAlignment),
          ),
        ],
      ),
    );
  }

  void _toggleAttribute(Attribute attribute) {
    final currentAttr = controller
        .getSelectionStyle()
        .attributes[attribute.key];
    final bool isSameValue =
        currentAttr != null && currentAttr.value == attribute.value;

    final Attribute toApply = isSameValue
        ? Attribute.clone(attribute, null)
        : attribute;

    controller.formatSelection(toApply);
  }

  bool _isAttributeActive(Attribute attribute) {
    final selection = controller.selection;
    if (selection.isCollapsed) {
      return controller.getSelectionStyle().attributes.containsValue(attribute);
    } else {
      return controller.getAllSelectionStyles().any(
        (style) => style.attributes.containsValue(attribute),
      );
    }
  }
}

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Container(
      width: 1,
      height: 20,
      color: colorScheme.outline,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
