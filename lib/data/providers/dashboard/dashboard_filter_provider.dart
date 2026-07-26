import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/dashboard/dashboard_filter_request.dart';

part 'dashboard_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class DashboardFilterNotifier extends _$DashboardFilterNotifier {
  @override
  DashboardFilterRequest build() => const DashboardFilterRequest();

  void update(DashboardFilterRequest next) => state = next;

  void clear() => state = const DashboardFilterRequest();
}
