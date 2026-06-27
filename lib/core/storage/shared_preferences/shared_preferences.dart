import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

@riverpod
SharedPreferencesHandler sharedPreferencesHandler(Ref ref) {
  return SharedPreferencesHandler();
}

class SharedPreferencesHandler {
  final log = Logger();
  final asyncPrefs = SharedPreferencesAsync(
    options: SharedPreferencesOptions(),
  );

  Future<void> setFirstLaunch(bool value) async {
    try {
      await asyncPrefs.setBool('firstLaunch', value);
      log.i('First launch status saved: $value');
    } on Exception catch (e) {
      log.e('Failed to save first launch status: $e');
    }
  }

  Future<bool> isFirstLaunch() async {
    try {
      final value = await asyncPrefs.getBool('firstLaunch');
      log.i('First launch status loaded: $value');
      return value ?? true;
    } on Exception catch (e) {
      log.e('Failed to load first launch status: $e');
      return false;
    }
  }

  Future<void> setTheme(ThemeMode value) async {
    try {
      await asyncPrefs.setString('theme', value.name);
      log.i('Theme preference saved: $value');
    } on Exception catch (e) {
      log.e('Failed to save theme preference: $e');
    }
  }

  Future<ThemeMode> getTheme() async {
    try {
      final value = await asyncPrefs.getString('theme');
      log.i('Theme preference loaded: $value');
      return ThemeMode.values.firstWhere(
        (v) => v.name == value,
        orElse: () => ThemeMode.system,
      );
    } on Exception catch (e) {
      log.e('Failed to load theme preference: $e');
      return ThemeMode.system;
    }
  }

  Future<void> setString(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      log.i('Preference saved [$key]: $value');
    } on Exception catch (e) {
      log.e('Failed to save preference [$key]: $e');
    }
  }

  Future<String?> getString(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString(key);
      log.i('Preference loaded [$key]: $value');
      return value;
    } on Exception catch (e) {
      log.e('Failed to load preference [$key]: $e');
      return null;
    }
  }

  Future<void> remove(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
      log.i('Preference removed [$key]');
    } on Exception catch (e) {
      log.e('Failed to remove preference [$key]: $e');
    }
  }
}
