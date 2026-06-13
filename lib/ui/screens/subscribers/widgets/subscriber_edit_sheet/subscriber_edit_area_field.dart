import 'package:flutter/material.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/area_selecting_screen.dart';
import '../area_select/area_select_field.dart';

class SubscriberEditAreaField extends StatelessWidget {
  final String? areaName;
  final String? errorText;
  final bool enabled;
  final ValueChanged<Area> onAreaSelected;

  const SubscriberEditAreaField({
    super.key,
    required this.areaName,
    this.errorText,
    required this.enabled,
    required this.onAreaSelected,
  });

  Future<void> _openAreaSelecting(BuildContext context) async {
    final result = await Navigator.of(context).push(
      openInnerScreen(widget: const AreaSelectingScreen()),
    );
    if (result is Area) onAreaSelected(result);
  }

  @override
  Widget build(BuildContext context) {
    return AreaSelectField(
      areaName: areaName,
      errorText: errorText,
      onTap: enabled ? () => _openAreaSelecting(context) : () {},
    );
  }
}
