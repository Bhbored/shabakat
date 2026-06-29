import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shabakat/core/themes/theme_mode_provider.dart';
import 'package:shabakat/core/themes/theme_selector.dart';
import 'package:shabakat/ui/splash/splash_screen.dart';

const _languageKey = 'language';

Locale _localeFromCode(String? language) {
  return switch (language?.trim().toLowerCase()) {
    'ar' => const Locale('ar'),
    _ => const Locale('en'),
  };
}

Future<Locale> _prepareLocale() async {
  final prefs = await SharedPreferences.getInstance();
  final locale = _localeFromCode(prefs.getString(_languageKey));
  await prefs.setString('locale', locale.languageCode);
  return locale;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final startLocale = await _prepareLocale();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: startLocale,
        saveLocale: true,
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeSelector.light(),
      darkTheme: ThemeSelector.dark(),
      themeMode: themeModeAsync.value ?? ThemeMode.system,
      builder: (context, child) {
        return SafeArea(
          top: false,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const SplashScreen(),
    );
  }
}
