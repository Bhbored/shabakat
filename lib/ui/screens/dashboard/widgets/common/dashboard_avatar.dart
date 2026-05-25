import 'package:flutter/material.dart';
import 'package:shabakat/ui/data/app_data.dart';

class DashboardAvatar extends StatelessWidget {
  final String name;
  final double size;
  final Color? color;

  const DashboardAvatar({
    super.key,
    required this.name,
    this.size = 36,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final initials = name.split(' ').map((n) => n[0]).take(2).join('').toUpperCase();
    final bgColor = color ?? avatarColorFor(name);
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.33,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
