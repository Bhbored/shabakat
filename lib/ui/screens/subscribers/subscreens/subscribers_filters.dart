import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/customer_type.dart';

class SubscribersFilters extends StatefulWidget {
  const SubscribersFilters({super.key});

  @override
  State<SubscribersFilters> createState() => _SubscribersFiltersState();
}

class _SubscribersFiltersState extends State<SubscribersFilters> {
  CustomerRelation? _relation;
  CustomerStatus? _status;
  CustomerType? _type;
  String _sortOrder = 'latest';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Filters'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Relation', style: theme.textTheme.bodySmall),
            SizedBox(height: context.spaceSmall),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingMedium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.borderRadiusMedium,
                    ),
                    border: Border.all(color: scheme.outline),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomerRelation?>(
                      padding: EdgeInsets.zero,
                      isExpanded: true,
                      menuWidth: constraints.maxWidth,
                      borderRadius: BorderRadius.circular(
                        context.borderRadiusMedium,
                      ),
                      dropdownColor: scheme.surfaceContainerHigh,
                      elevation: 4,
                      alignment: AlignmentDirectional.centerStart,
                      style: theme.textTheme.bodyMedium,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: scheme.onSurfaceVariant,
                        size: 22,
                      ),
                      hint: const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('All'),
                      ),
                      value: _relation,
                      items: CustomerRelation.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.label),
                        );
                      }).toList(),
                      onChanged: (v) => setState(() => _relation = v),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: context.spaceMedium),
            Text('Status', style: theme.textTheme.bodySmall),
            SizedBox(height: context.spaceSmall),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingMedium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.borderRadiusMedium,
                    ),
                    border: Border.all(color: scheme.outline),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomerStatus?>(
                      padding: EdgeInsets.zero,
                      isExpanded: true,
                      menuWidth: constraints.maxWidth,
                      borderRadius: BorderRadius.circular(
                        context.borderRadiusMedium,
                      ),
                      dropdownColor: scheme.surfaceContainerHigh,
                      elevation: 4,
                      alignment: AlignmentDirectional.centerStart,
                      style: theme.textTheme.bodyMedium,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: scheme.onSurfaceVariant,
                        size: 22,
                      ),
                      hint: const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('All'),
                      ),
                      value: _status,
                      items: CustomerStatus.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.label),
                        );
                      }).toList(),
                      onChanged: (v) => setState(() => _status = v),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: context.spaceMedium),
            Text('Type', style: theme.textTheme.bodySmall),
            SizedBox(height: context.spaceSmall),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingMedium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.borderRadiusMedium,
                    ),
                    border: Border.all(color: scheme.outline),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomerType?>(
                      padding: EdgeInsets.zero,
                      isExpanded: true,
                      menuWidth: constraints.maxWidth,
                      borderRadius: BorderRadius.circular(
                        context.borderRadiusMedium,
                      ),
                      dropdownColor: scheme.surfaceContainerHigh,
                      elevation: 4,
                      alignment: AlignmentDirectional.centerStart,
                      style: theme.textTheme.bodyMedium,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: scheme.onSurfaceVariant,
                        size: 22,
                      ),
                      hint: const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('All'),
                      ),
                      value: _type,
                      items: CustomerType.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.label),
                        );
                      }).toList(),
                      onChanged: (v) => setState(() => _type = v),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: context.spaceMedium),
            Text('Created At', style: theme.textTheme.bodySmall),
            SizedBox(height: context.spaceSmall),
            ListTile(
              title: const Text('Latest'),
              trailing: _sortOrder == 'latest'
                  ? Icon(Icons.check, color: scheme.primary)
                  : null,
              onTap: () => setState(() => _sortOrder = 'latest'),
            ),
            ListTile(
              title: const Text('Oldest'),
              trailing: _sortOrder == 'oldest'
                  ? Icon(Icons.check, color: scheme.primary)
                  : null,
              onTap: () => setState(() => _sortOrder = 'oldest'),
            ),
          ],
        ),
      ),
    );
  }
}
