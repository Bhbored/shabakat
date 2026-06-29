import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/company/update_profile_request.dart';
import 'package:shabakat/core/network/dto/response/company/get_profile_response.dart';
import 'package:shabakat/core/network/services/company/company_service.dart';

part 'company_profile_provider.g.dart';

Duration? retry(int _, Object _) => null;

class CompanyProfileUploadState {
  const CompanyProfileUploadState({
    this.isUploading = false,
    this.localLogoPath,
  });

  final bool isUploading;
  final String? localLogoPath;

  CompanyProfileUploadState copyWith({
    bool? isUploading,
    String? localLogoPath,
    bool clearLocalLogoPath = false,
  }) {
    return CompanyProfileUploadState(
      isUploading: isUploading ?? this.isUploading,
      localLogoPath:
          clearLocalLogoPath ? null : (localLogoPath ?? this.localLogoPath),
    );
  }
}

@Riverpod(keepAlive: true)
class CompanyProfileUploadNotifier extends _$CompanyProfileUploadNotifier {
  @override
  CompanyProfileUploadState build() => const CompanyProfileUploadState();

  void update(CompanyProfileUploadState next) => state = next;

  void clear() => state = const CompanyProfileUploadState();
}

@Riverpod(keepAlive: true, retry: retry)
class CompanyProfileNotifier extends _$CompanyProfileNotifier {
  CompanyService get _companyService => ref.read(companyServiceProvider);

  @override
  FutureOr<GetProfileResponse> build() async => _companyService.getProfile();

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> updateProfile(UpdateProfileRequest request) async {
    await _companyService.updateProfile(request);
    await refresh();
  }
}
