import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/profile/data/models/logout_response.dart';
import 'package:parki_dog/features/profile/domain/repository/base_profile_repository.dart';

class LogoutUseCase extends BaseUseCase<LogoutResponse, NoParameters> {
  final BaseProfileRepository baseProfileRepository;

  LogoutUseCase(this.baseProfileRepository);

  @override
  Future<(Failure?, LogoutResponse?)> call(NoParameters parameters) {
    return baseProfileRepository.logout(parameters);
  }
}
