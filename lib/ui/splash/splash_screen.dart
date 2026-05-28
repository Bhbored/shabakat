import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/auth/auth_provider.dart';
import 'package:shabakat/ui/auth/login/login_screen.dart';
import 'package:shabakat/ui/nav_container/main_tab_page.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _animationComplete = false;
  bool _hasNavigated = false;

  late final Animation<double> _ripple1 = Tween<double>(begin: 0, end: 1)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.8, curve: Curves.easeOutQuad),
        ),
      );

  late final Animation<double> _ripple2 = Tween<double>(begin: 0, end: 1)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.15, 0.85, curve: Curves.easeOutQuad),
        ),
      );

  late final Animation<double> _ripple3 = Tween<double>(begin: 0, end: 1)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.3, 0.9, curve: Curves.easeOutQuad),
        ),
      );

  late final Animation<double> _iconScale = Tween<double>(begin: 0, end: 1)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
        ),
      );

  late final Animation<double> _iconRotation = Tween<double>(begin: -1, end: 0)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
        ),
      );

  late final Animation<double> _glowPulse =
      TweenSequence<double>([
        TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 1, end: 0.6), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 0.6, end: 1), weight: 1),
      ]).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
        ),
      );

  late final Animation<double> _titleFade = Tween<double>(begin: 0, end: 1)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.45, 0.7, curve: Curves.easeOut),
        ),
      );

  late final Animation<Offset> _titleSlide =
      Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.45, 0.7, curve: Curves.easeOut),
        ),
      );

  late final Animation<double> _subtitleFade = Tween<double>(begin: 0, end: 1)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.65, 0.9, curve: Curves.easeOut),
        ),
      );

  late final Animation<double> _loaderFade = Tween<double>(begin: 0, end: 1)
      .animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
        ),
      );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    );
    _controller.forward().whenComplete(() {
      if (mounted) {
        setState(() => _animationComplete = true);
        _tryNavigate();
      }
    });
  }

  void _tryNavigate() {
    if (_hasNavigated) return;

    final authState = ref.read(authStateProvider);
    authState.whenOrNull(
      data: (isAuthenticated) {
        _hasNavigated = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) =>
                    isAuthenticated ? const MainTabPage() : const LoginScreen(),
              ),
            );
          }
        });
      },
      error: (_, _) {
        _hasNavigated = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    ref.listen(authStateProvider, (_, next) {
      if (_animationComplete) {
        _tryNavigate();
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _Ripple(animation: _ripple1, colorScheme: colorScheme),
                  _Ripple(animation: _ripple2, colorScheme: colorScheme),
                  _Ripple(animation: _ripple3, colorScheme: colorScheme),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _iconScale.value,
                        child: Transform.rotate(
                          angle: _iconRotation.value,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: colorScheme.primary.withValues(
                                    alpha: 0.35 * _glowPulse.value,
                                  ),
                                  blurRadius: 50,
                                  spreadRadius: 8,
                                ),
                              ],
                            ),
                            child: Icon(
                              LucideIcons.zap,
                              size: 64,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: context.spaceLarge),
            FadeTransition(
              opacity: _titleFade,
              child: SlideTransition(
                position: _titleSlide,
                child: Text(
                  'Shabakat',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.spaceSmall),
            FadeTransition(
              opacity: _subtitleFade,
              child: Text(
                'Powering Your Generators',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: context.spaceExtraLarge),
            FadeTransition(
              opacity: _loaderFade,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Ripple extends StatelessWidget {
  final Animation<double> animation;
  final ColorScheme colorScheme;

  const _Ripple({required this.animation, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: 80 + (120 * animation.value),
          height: 80 + (120 * animation.value),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.primary.withValues(
                alpha: (1 - animation.value) * 0.25,
              ),
              width: 1.5,
            ),
          ),
        );
      },
    );
  }
}
