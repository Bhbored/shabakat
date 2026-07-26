import 'package:flutter/material.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/box_selecting_screen.dart';
import '../box_select/box_select_field.dart';

class SubscriberEditBoxField extends StatelessWidget {
  final String? areaId;
  final String? boxName;
  final bool enabled;
  final ValueChanged<DistributionBox> onBoxSelected;

  const SubscriberEditBoxField({
    super.key,
    required this.areaId,
    required this.boxName,
    required this.enabled,
    required this.onBoxSelected,
  });

  Future<void> _openBoxSelecting(BuildContext context) async {
    if (areaId == null) return;
    final result = await Navigator.of(context).push(
      openInnerScreen(widget: BoxSelectingScreen(areaId: areaId!)),
    );
    if (result is DistributionBox) onBoxSelected(result);
  }

  @override
  Widget build(BuildContext context) {
    return BoxSelectField(
      boxName: boxName,
      enabled: enabled && areaId != null,
      onTap: () => _openBoxSelecting(context),
    );
  }
}
