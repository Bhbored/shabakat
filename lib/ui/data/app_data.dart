import 'package:flutter/material.dart';

enum SubscriberStatus { paid, unpaid, overdue }

class Subscriber {
  final int id;
  final String name;
  final String phone;
  final String area;
  final String ampere;
  final String subscriptionDate;
  final SubscriberStatus status;
  final int amount;
  final String dueDate;

  const Subscriber({
    required this.id,
    required this.name,
    required this.phone,
    required this.area,
    required this.ampere,
    required this.subscriptionDate,
    required this.status,
    required this.amount,
    required this.dueDate,
  });
}

class RevenuePoint {
  final String month;
  final double billed;
  final double collected;

  const RevenuePoint({
    required this.month,
    required this.billed,
    required this.collected,
  });
}

const List<RevenuePoint> revenueData = [
  RevenuePoint(month: 'Dec', billed: 9800, collected: 8200),
  RevenuePoint(month: 'Jan', billed: 10500, collected: 9100),
  RevenuePoint(month: 'Feb', billed: 11200, collected: 9800),
  RevenuePoint(month: 'Mar', billed: 12100, collected: 10500),
  RevenuePoint(month: 'Apr', billed: 11800, collected: 10200),
  RevenuePoint(month: 'May', billed: 12450, collected: 11100),
];

const List<Color> avatarColors = [
  Color(0xFF7c3aed),
  Color(0xFF2563eb),
  Color(0xFF059669),
  Color(0xFFdb2777),
  Color(0xFFea580c),
  Color(0xFF0891b2),
  Color(0xFFd97706),
];

Color avatarColorFor(String name) {
  return avatarColors[name.codeUnitAt(0) % avatarColors.length];
}
