import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/core/network/services/dashboard/dashboard_service.dart';
import 'package:shabakat/data/providers/dashboard/dashboard_filter_provider.dart';

part 'dashboard_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class DashboardNotifier extends _$DashboardNotifier {
  DashboardService get _dashboardService => ref.read(dashboardServiceProvider);

  @override
  FutureOr<DashboardSummaryResponse> build() async {
    final filter = ref.watch(dashboardFilterProvider);
    return _dashboardService.getSummary(filter);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await build());
  }
}
