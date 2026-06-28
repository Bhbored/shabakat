import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract final class DayOfMonthFormatter {
  static String format(BuildContext context, int day) {
    final label = context.locale.languageCode == 'ar'
        ? day.toString()
        : _englishOrdinal(day);
    return 'settings.day_of_month'.tr(args: [label]);
  }

  static String _englishOrdinal(int day) {
    if (day >= 11 && day <= 13) return '${day}th';
    return switch (day % 10) {
      1 => '${day}st',
      2 => '${day}nd',
      3 => '${day}rd',
      _ => '${day}th',
    };
  }

  static DateTime dateFromDay(int day, [DateTime? reference]) {
    final ref = reference ?? DateTime.now();
    final lastDay = DateTime(ref.year, ref.month + 1, 0).day;
    return DateTime(ref.year, ref.month, day.clamp(1, lastDay));
  }
}
