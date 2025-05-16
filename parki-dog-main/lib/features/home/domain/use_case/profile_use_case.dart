import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';
import 'package:parki_dog/features/profile/data/models/profile_response.dart';

class ProfileUseCase extends BaseUseCase<ProfileResponse, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  ProfileUseCase(this.baseHomeRepository);

  @override
  Future<(Failure?, ProfileResponse?)> call(NoParameters parameters) {
    return baseHomeRepository.profile(parameters);
  }
}
