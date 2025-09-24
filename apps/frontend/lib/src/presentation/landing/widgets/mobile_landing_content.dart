import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/widgets/app_button.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/presentation/landing/widgets/terms_and_condition.dart';
import 'package:frontend/src/presentation/landing/widgets/recall_logo.dart';

class MobileLandingContent extends StatelessWidget {
  const MobileLandingContent({
    super.key,
    required this.onSignInWithGoogle,
    required this.onSignInWithGitHub,
    required this.onTermsAndConditionsChanged,
    required this.termsAndConditionsChecked,
  });

  final VoidCallback onSignInWithGoogle;
  final VoidCallback onSignInWithGitHub;
  final bool termsAndConditionsChecked;
  final void Function(bool?) onTermsAndConditionsChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const RecallLogo(),
            AppButton(
              onPressed: onSignInWithGoogle,
              text: 'Sign in with Google',
              icon: AppIcon.google(size: 16),
            ),
            SizedBox(height: context.isMobile ? 18 : 12),
            AppButton(
              onPressed: onSignInWithGitHub,
              text: 'Sign in with GitHub',
              icon: AppIcon.github(size: 16),
            ),
            SizedBox(height: context.isMobile ? 18 : 16),
            TermsAndConditions(
              onCheckboxChanged: onTermsAndConditionsChanged,
              value: termsAndConditionsChecked,
            ),
          ],
        ),
      ),
    );
  }
}
