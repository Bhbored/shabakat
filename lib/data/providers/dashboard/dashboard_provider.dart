import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/core/network/services/dashboard/dashboard_service.dart';

part 'dashboard_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class DashboardNotifier extends _$DashboardNotifier {
  DashboardService get _dashboardService => ref.read(dashboardServiceProvider);

  @override
  FutureOr<DashboardSummaryResponse> build() async =>
      _dashboardService.getSummary();

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
