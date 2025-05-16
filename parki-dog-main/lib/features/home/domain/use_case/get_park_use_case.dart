import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/home/data/models/park.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';

class GetParkUseCase extends BaseUseCase<Park, GetParkParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetParkUseCase(this.baseHomeRepository);

  @override
  Future<(Failure?, Park?)> call(GetParkParameters parameters) {
    return baseHomeRepository.getPark(parameters);
  }
}

class GetParkParameters extends Equatable {
  final int id;

  const GetParkParameters(this.id);

  @override
  List<Object?> get props => [id];
}
