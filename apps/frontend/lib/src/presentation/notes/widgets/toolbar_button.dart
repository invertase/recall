import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';

class ToolBarButton extends StatelessWidget {
  const ToolBarButton({
    super.key,
    required this.iconName,
    required this.onPressed,
    this.isEnabled = true,
    this.isActive = false,
  });

  final String iconName;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isActive
              ? colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          border: isActive
              ? Border.all(color: colorScheme.primary.withValues(alpha: 0.3))
              : null,
        ),
        child: AppIcon(assetName: '$iconName.svg'),
      ),
    );
  }
}

class HeaderToolBarButton extends StatelessWidget {
  const HeaderToolBarButton({
    super.key,
    required this.controller,
    required this.toggleAttribute,
  });

  final QuillController controller;
  final void Function(Attribute attribute) toggleAttribute;

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: PopupMenuButton<Attribute<int?>>(
        initialValue: _getCurrentHeaderLevel(),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: const Attribute('normal', AttributeScope.inline, null),
            enabled: true,
            child: Text(
              'Normal',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
          PopupMenuItem(
            value: Attribute.h1,
            child: Text(
              'Heading 1',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
          PopupMenuItem(
            value: Attribute.h2,
            child: Text(
              'Heading 2',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
          PopupMenuItem(
            value: Attribute.h3,
            child: Text(
              'Heading 3',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
        ],
        onSelected: (Attribute? attribute) {
          if (attribute == null || attribute.key == 'normal') {
            controller.formatSelection(Attribute.clone(Attribute.header, null));
          } else {
            toggleAttribute(attribute);
          }
        },
        position: PopupMenuPosition.under,
        color: colorScheme.background,
        child: AppIcon.font(),
      ),
    );
  }

  Attribute<int?>? _getCurrentHeaderLevel() {
    final style = controller.getSelectionStyle();
    final headerAttribute = style.attributes[Attribute.header.key];

    if (headerAttribute == null) return null;

    switch (headerAttribute.value) {
      case 1:
        return Attribute.h1;
      case 2:
        return Attribute.h2;
      case 3:
        return Attribute.h3;
      default:
        return null;
    }
  }
}
