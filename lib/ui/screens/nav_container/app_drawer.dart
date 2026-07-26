import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/auth/auth_provider.dart';
import 'package:shabakat/data/providers/company/company_profile_provider.dart';
import 'package:shabakat/ui/screens/auth/login/login_screen.dart';
import 'package:shabakat/ui/screens/calculator/fixed_kilowatt_calculator_screen.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';
import 'package:shabakat/ui/settings/settings_screen.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import 'package:shabakat/ui/shared/widgets/offline_sync_dialog.dart';

class AppDrawer extends ConsumerWidget {
  final Future<void> Function()? onEnterOfflineMode;

  const AppDrawer({super.key, this.onEnterOfflineMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = ref.watch(authStateProvider);
    final profileAsync = ref.watch(companyProfileProvider);
    final profile = profileAsync.value;
    final companyName = profile?.name.trim() ?? '';
    final logoUrl = profile?.logoUrl?.trim();
    final avatarSize = context.screenWidth * 0.12;

    return Drawer(
      backgroundColor: colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.paddingMedium),
              child: Row(
                children: [
                  _DrawerLogo(
                    size: avatarSize,
                    logoUrl: logoUrl,
                    fallbackName: companyName.isNotEmpty
                        ? companyName
                        : 'Shabakat',
                  ),
                  SizedBox(width: context.paddingSmall),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shabakat',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (companyName.isNotEmpty)
                          Text(
                            companyName,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
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
                      final navigator = Navigator.of(context);
                      Navigator.pop(context);
                      navigator.push(
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  _DrawerItem(
                    icon: LucideIcons.calculator,
                    label: 'drawer.calculator'.tr(),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        openInnerScreen(
                          widget: const FixedKilowattCalculatorScreen(),
                        ),
                      );
                    },
                  ),
                  _DrawerItem(
                    icon: LucideIcons.refreshCw,
                    label: 'drawer.offline_sync.menu'.tr(),
                    onTap: () {
                      Navigator.pop(context);
                      showOfflineSyncDialog(context: context);
                    },
                  ),
                  if (onEnterOfflineMode != null)
                    _DrawerItem(
                      icon: LucideIcons.cloudOff,
                      label: 'drawer.offline_mode'.tr(),
                      onTap: () {
                        Navigator.pop(context);
                        onEnterOfflineMode!();
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

class _DrawerLogo extends StatelessWidget {
  final double size;
  final String? logoUrl;
  final String fallbackName;

  const _DrawerLogo({
    required this.size,
    required this.logoUrl,
    required this.fallbackName,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final url = logoUrl?.trim();

    if (url == null || url.isEmpty) {
      return DashboardAvatar(name: fallbackName, size: size);
    }

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: (_, _) => SizedBox(
          width: size,
          height: size,
          child: Center(
            child: SizedBox(
              width: size * 0.35,
              height: size * 0.35,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorScheme.primary,
              ),
            ),
          ),
        ),
        errorWidget: (_, _, _) =>
            DashboardAvatar(name: fallbackName, size: size),
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
