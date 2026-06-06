import 'package:flutter/material.dart';
import 'package:shabakat/domain/entities/area/area.dart';

class AreaSelectList extends StatelessWidget {
  final List<Area> areas;
  final ValueChanged<Area> onAreaSelected;

  const AreaSelectList({
    super.key,
    required this.areas,
    required this.onAreaSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (areas.isEmpty) {
      return Center(
        child: Text(
          'No areas found',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: areas.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final area = areas[index];
        return ListTile(
          title: Text(
            area.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => onAreaSelected(area),
        );
      },
    );
  }
}
