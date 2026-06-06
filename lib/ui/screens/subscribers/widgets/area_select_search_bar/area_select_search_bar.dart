import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class AreaSelectSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const AreaSelectSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: true,
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Search areas...',
                prefixIcon: Icon(Icons.search, size: 20),
              ),
            ),
          ),
          SizedBox(width: context.paddingSmall),
          IconButton(
            onPressed: controller.text.isEmpty ? null : onClear,
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
