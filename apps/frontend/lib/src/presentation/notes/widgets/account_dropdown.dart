import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/providers/auth_provider.dart';

class AccountDropdown extends ConsumerWidget {
  const AccountDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;
    final authState = ref.watch(authStateProvider);
    final user = authState.value;

    if (user == null) return const SizedBox.shrink();

    final initials =
        '${user.firstName.isNotEmpty ? user.firstName[0] : ''}${user.lastName.isNotEmpty ? user.lastName[0] : ''}'
            .toUpperCase();

    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'signOut',
          child: const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
          ),
          onTap: () => ref.read(authStateProvider.notifier).signOut(),
        ),
      ],
      position: PopupMenuPosition.under,
      color: colorScheme.background,
      elevation: 2,
      constraints: const BoxConstraints(maxWidth: 120),
      menuPadding: EdgeInsets.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: textTheme.body?.copyWith(
                      color: AppColors.colourWhite,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                user.firstName,
                style: textTheme.body?.copyWith(color: colorScheme.onSurface),
              ),
              const SizedBox(width: 24),
              Icon(
                Icons.keyboard_arrow_down,
                color: colorScheme.onSurface,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
