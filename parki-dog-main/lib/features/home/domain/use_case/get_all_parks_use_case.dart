import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/home/data/models/all_parks_response.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';

class GetAllParksUseCase extends BaseUseCase<AllParksResponse, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetAllParksUseCase(this.baseHomeRepository);

  @override
  Future<(Failure?, AllParksResponse?)> call(NoParameters parameters) {
    return baseHomeRepository.getAllParks(parameters);
  }
}
