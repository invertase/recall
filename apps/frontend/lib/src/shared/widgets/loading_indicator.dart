import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    required this.child,
    this.isLoading = false,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) ...[
          Positioned.fill(
            child: ColoredBox(color: AppColors.colourWhite.withAlpha(153)),
          ),
          Center(
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              strokeWidth: 4,
              color: AppColors.purple.shade500,
            ),
          ),
        ],
      ],
    );
  }
}
