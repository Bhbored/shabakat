import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/auth/auth_provider.dart';
import 'package:shabakat/ui/screens/auth/login/login_screen.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';
import 'package:shabakat/ui/settings/settings_screen.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = ref.watch(authStateProvider);

    return Drawer(
      backgroundColor: colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.paddingMedium),
              child: Row(
                children: [
                  DashboardAvatar(
                    name: 'Admin User',
                    size: context.screenWidth * 0.12,
                  ),
                  SizedBox(width: context.paddingSmall),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin User',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'El-Nour Generators',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: colorScheme.outline),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: context.spaceSmall),
                children: [
                  _DrawerItem(
                    icon: LucideIcons.settings,
                    label: 'drawer.settings'.tr(),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  _DrawerItem(
                    icon: LucideIcons.helpCircle,
                    label: 'drawer.help_support'.tr(),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Divider(color: colorScheme.outline),
            Padding(
              padding: EdgeInsets.all(context.paddingMedium),
              child: SizedBox(
                width: double.infinity,
                child: authState.isLoading
                    ? ElevatedButton(
                        onPressed: null,
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      )
                    : ElevatedButton.icon(
                        onPressed: () async {
                          Navigator.pop(context);
                          await ref.read(authStateProvider.notifier).logout();
                          if (context.mounted) {
                            await Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        icon: const Icon(LucideIcons.logOut, size: 18),
                        label: authState.isLoading
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colorScheme.onPrimary,
                              )
                            : Text('drawer.logout'.tr()),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface.withValues(alpha: 0.8),
        ),
      ),
      trailing: Icon(
        LucideIcons.chevronRight,
        size: 16,
        color: colorScheme.onSurface.withValues(alpha: 0.4),
      ),
      onTap: onTap,
    );
  }
}
