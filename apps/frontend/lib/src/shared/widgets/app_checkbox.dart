import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({super.key, required this.value, required this.onChanged});

  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      fillColor: WidgetStateProperty.all(AppColors.colourWhite),
      checkColor: AppColors.colourBlack,
      side: BorderSide(color: AppColors.grey.shade400),
    );
  }
}
