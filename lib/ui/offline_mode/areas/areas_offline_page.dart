import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/ui/screens/areas/widgets/area_list/area_list.dart';
import 'package:shabakat/ui/screens/areas/widgets/areas_toolbar/areas_toolbar.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/areas_skeleton.dart';

class AreasOfflinePage extends ConsumerWidget {
  const AreasOfflinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final areasAsync = ref.watch(areaProvider);

    return areasAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const AreasSkeleton(),
      error: (err, _) => DynamicError(
        text: err is ApiException ? err.userMessage : 'areas.load_failed'.tr(),
        onTryAgain: () => ref.read(areaProvider.notifier).refresh(),
      ),
      data: (areas) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AreasToolbar(totalCount: areas.length, readOnly: true),
          SizedBox(height: context.spaceSmall),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(areaProvider);
              },
              child: AreaList(areas: areas, readOnly: true),
            ),
          ),
        ],
      ),
    );
  }
}
