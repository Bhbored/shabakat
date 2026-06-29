import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/company/update_preferences_request.dart';
import 'package:shabakat/core/network/services/company/company_service.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';
import 'package:shabakat/domain/mappers/company_preferences/company_preferences_mapper.dart';
part 'company_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class CompanyNotifier extends _$CompanyNotifier {
  CompanyService get _companyService => ref.read(companyServiceProvider);

  @override
  FutureOr<CompanyPreferences> build() async => await _loadPreferences();

  Future<CompanyPreferences> _loadPreferences() async {
    final preferences = await _companyService.getPreferences();
    return preferences.toEntity();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> upsertPreferences(UpdatePreferencesRequest request) async {
    await _companyService.upsertPreferences(request);
    await refresh();
  }
}
