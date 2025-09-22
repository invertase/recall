import 'package:flutter/material.dart';
import 'package:frontend/src/presentation/landing/widgets/landing_hero.dart';
import 'package:frontend/src/presentation/landing/widgets/sign_in_card.dart';

class DesktopLandingContent extends StatelessWidget {
  const DesktopLandingContent({
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
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(child: LandingHero()),

          const SizedBox(width: 60),

          SignInCard(
            onSignInWithGoogle: onSignInWithGoogle,
            onSignInWithGitHub: onSignInWithGitHub,
            onTermsAndConditionsChanged: onTermsAndConditionsChanged,
            termsAndConditionsChecked: termsAndConditionsChecked,
          ),
        ],
      ),
    );
  }
}
