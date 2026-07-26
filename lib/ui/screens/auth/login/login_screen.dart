import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/auth/login_request.dart';
import 'package:shabakat/data/providers/auth/auth_provider.dart';
import 'package:shabakat/ui/screens/nav_container/main_tab_page.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _hasNavigated = false;
  Object? _shownError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    _shownError = null;

    ref
        .read(authStateProvider.notifier)
        .login(
          LoginRequest(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = ref.watch(authStateProvider);

    if (!authState.isLoading && context.mounted) {
      authState.whenOrNull(
        data: (isAuthenticated) {
          if (isAuthenticated && !_hasNavigated) {
            _hasNavigated = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!context.mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const MainTabPage()),
                (route) => false,
              );
            });
          }
        },
        error: (error, _) {
          if (error is ApiException && error != _shownError) {
            _shownError = error;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!context.mounted) return;
              AppSnackBar.show(
                context,
                message: error.userMessage,
                variant: AppSnackBarVariant.error,
              );
            });
          }
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(context.paddingMedium),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(context.paddingMedium),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.2),
                          blurRadius: 40,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      LucideIcons.zap,
                      size: context.screenWidth * 0.15,
                      color: colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: context.spaceLarge),
                  Text(
                    'auth.login.welcome'.tr(),
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.spaceSmall),
                  Text(
                    'auth.login.subtitle'.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.spaceLarge),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(context.paddingMedium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'auth.login.email'.tr(),
                              prefixIcon: Icon(LucideIcons.mail),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'auth.login.validation.email_required'
                                    .tr();
                              }
                              if (!value.contains('@')) {
                                return 'auth.login.validation.email_invalid'
                                    .tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: context.spaceMedium),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(),
                            decoration: InputDecoration(
                              hintText: 'auth.login.password'.tr(),
                              prefixIcon: Icon(LucideIcons.lock),
                              suffixIcon: IconButton(
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                                icon: Icon(
                                  _obscurePassword
                                      ? LucideIcons.eyeOff
                                      : LucideIcons.eye,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'auth.login.validation.password_required'
                                    .tr();
                              }
                              if (value.length < 6) {
                                return 'auth.login.validation.password_min_length'
                                    .tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: context.spaceLarge),
                          ElevatedButton(
                            onPressed: authState.isLoading ? null : _submit,
                            child: authState.isLoading
                                ? SizedBox(
                                    height: context.screenWidth * 0.05,
                                    width: context.screenWidth * 0.05,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: colorScheme.onPrimary,
                                    ),
                                  )
                                : Text('auth.login.sign_in'.tr()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
