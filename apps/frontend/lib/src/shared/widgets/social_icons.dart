import 'package:flutter/material.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/shared/widgets/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          icon: AppIcon.discord(),
          onTap: () => _launchUrl('https://invertase.link/globe-discord'),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: AppIcon.x(),
          onTap: () => _launchUrl('https://x.com/dart_globe'),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: AppIcon.github(),
          onTap: () => _launchUrl('https://github.com/invertase'),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: AppIcon.linkedin(),
          onTap: () => _launchUrl('https://www.linkedin.com/company/invertase'),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: AppIcon.email(),
          onTap: () => _launchUrl('mailto:contact@globe.dev'),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
