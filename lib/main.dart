import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/themes/theme_selector.dart';
import 'package:shabakat/ui/nav_container/main_tab_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shabakat',
      debugShowCheckedModeBanner: false,
      theme: ThemeSelector.light(),
      darkTheme: ThemeSelector.dark(),
      themeMode: ThemeMode.dark,

      home: const MainTabPage(),
    );
  }
}
