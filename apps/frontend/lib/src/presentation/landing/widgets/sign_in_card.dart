import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_button.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/presentation/landing/widgets/recall_logo.dart';
import 'package:frontend/src/presentation/landing/widgets/terms_and_condition.dart';

class SignInCard extends StatelessWidget {
  const SignInCard({
    super.key,
    required this.onSignInWithGoogle,
    required this.onSignInWithGitHub,
    required this.onTermsAndConditionsChanged,
    required this.termsAndConditionsChecked,
  });

  final VoidCallback onSignInWithGoogle;
  final VoidCallback onSignInWithGitHub;
  final void Function(bool?) onTermsAndConditionsChanged;
  final bool termsAndConditionsChecked;

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final isDark = Theme.brightnessOf(context) == Brightness.dark;

    return Container(
      width: 303,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.grey.shade50,
        border: Border.all(color: colorScheme.outline, width: 0.5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: AppColors.grey.shade50,
                  offset: const Offset(6, 6),
                  blurRadius: 10,
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const RecallLogo(),
          AppButton(
            onPressed: onSignInWithGoogle,
            text: 'Sign in with Google',
            icon: AppIcon.google(size: 16),
          ),
          const SizedBox(height: 12),
          AppButton(
            onPressed: onSignInWithGitHub,
            text: 'Sign in with GitHub',
            icon: AppIcon.github(size: 16),
          ),
          const SizedBox(height: 16),
          TermsAndConditions(
            onCheckboxChanged: onTermsAndConditionsChanged,
            value: termsAndConditionsChecked,
          ),
        ],
      ),
    );
  }
}
