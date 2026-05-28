import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/themes/theme_mode_provider.dart';
import 'package:shabakat/core/themes/theme_selector.dart';
import 'package:shabakat/ui/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeSelector.light(),
      darkTheme: ThemeSelector.dark(),
      themeMode: themeModeAsync.value ?? ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
