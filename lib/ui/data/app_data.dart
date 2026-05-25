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

const List<Subscriber> allSubscribers = [
  Subscriber(id: 1,  name: 'Ahmad Khalil',        phone: '+961 71 234 567', area: 'Hamra',            ampere: '5A',  subscriptionDate: 'Jan 15, 2024', status: SubscriberStatus.paid,    amount: 85,  dueDate: 'Jun 15, 2025'),
  Subscriber(id: 2,  name: 'Rania Mansour',       phone: '+961 70 345 678', area: 'Achrafieh',        ampere: '10A', subscriptionDate: 'Feb 1, 2024',  status: SubscriberStatus.unpaid,  amount: 150, dueDate: 'May 28, 2025'),
  Subscriber(id: 3,  name: 'Khalid Barakat',      phone: '+961 76 456 789', area: 'Verdun',           ampere: '5A',  subscriptionDate: 'Nov 20, 2023', status: SubscriberStatus.paid,    amount: 85,  dueDate: 'Jun 20, 2025'),
  Subscriber(id: 4,  name: 'Lara Haddad',         phone: '+961 78 567 890', area: 'Gemmayzeh',        ampere: '15A', subscriptionDate: 'Mar 10, 2024', status: SubscriberStatus.overdue, amount: 210, dueDate: 'May 10, 2025'),
  Subscriber(id: 5,  name: 'Hassan Nassar',       phone: '+961 71 678 901', area: 'Mar Elias',        ampere: '5A',  subscriptionDate: 'Jan 5, 2024',  status: SubscriberStatus.paid,    amount: 85,  dueDate: 'Jun 5, 2025'),
  Subscriber(id: 6,  name: 'Nadia Rizk',          phone: '+961 70 789 012', area: 'Badaro',           ampere: '10A', subscriptionDate: 'Dec 15, 2023', status: SubscriberStatus.unpaid,  amount: 150, dueDate: 'May 25, 2025'),
  Subscriber(id: 7,  name: 'Fadi Gemayel',        phone: '+961 76 890 123', area: 'Sodeco',           ampere: '20A', subscriptionDate: 'Apr 1, 2024',  status: SubscriberStatus.paid,    amount: 280, dueDate: 'Jun 1, 2025'),
  Subscriber(id: 8,  name: 'Carla Khoury',        phone: '+961 78 901 234', area: 'Ras Beirut',       ampere: '5A',  subscriptionDate: 'Feb 20, 2024', status: SubscriberStatus.paid,    amount: 85,  dueDate: 'Jun 20, 2025'),
  Subscriber(id: 9,  name: 'Rami Assaf',          phone: '+961 71 012 345', area: 'Raouche',          ampere: '10A', subscriptionDate: 'Oct 1, 2023',  status: SubscriberStatus.overdue, amount: 150, dueDate: 'May 1, 2025'),
  Subscriber(id: 10, name: 'Maya Frem',           phone: '+961 70 123 456', area: 'Tallet el Khayat', ampere: '15A', subscriptionDate: 'Mar 25, 2024', status: SubscriberStatus.paid,    amount: 210, dueDate: 'Jun 25, 2025'),
  Subscriber(id: 11, name: 'Elie Saab',           phone: '+961 76 234 567', area: 'Monot',            ampere: '5A',  subscriptionDate: 'Jan 30, 2024', status: SubscriberStatus.unpaid,  amount: 85,  dueDate: 'May 30, 2025'),
  Subscriber(id: 12, name: 'Joelle Abou Jaoude',  phone: '+961 78 345 678', area: 'Hamra',            ampere: '20A', subscriptionDate: 'Sep 15, 2023', status: SubscriberStatus.paid,    amount: 280, dueDate: 'Jun 15, 2025'),
  Subscriber(id: 13, name: 'Georges Nassar',      phone: '+961 71 456 789', area: 'Achrafieh',        ampere: '10A', subscriptionDate: 'Apr 10, 2024', status: SubscriberStatus.paid,    amount: 150, dueDate: 'Jun 10, 2025'),
  Subscriber(id: 14, name: 'Sandra Zgheib',       phone: '+961 70 567 890', area: 'Verdun',           ampere: '5A',  subscriptionDate: 'Feb 14, 2024', status: SubscriberStatus.overdue, amount: 85,  dueDate: 'May 14, 2025'),
  Subscriber(id: 15, name: 'Marwan Tabbara',      phone: '+961 76 678 901', area: 'Gemmayzeh',        ampere: '30A', subscriptionDate: 'Aug 1, 2023',  status: SubscriberStatus.paid,    amount: 390, dueDate: 'Jun 1, 2025'),
];

const List<RevenuePoint> revenueData = [
  RevenuePoint(month: 'Dec', billed: 9800,  collected: 8200),
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
