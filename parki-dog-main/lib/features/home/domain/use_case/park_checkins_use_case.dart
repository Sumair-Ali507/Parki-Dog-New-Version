import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/home/data/models/park_chek_in_response.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';

class ParkCheckinsUseCase
    extends BaseUseCase<ParkCheckInsResponse, ParkCheckInsParameters> {
  final BaseHomeRepository baseHomeRepository;

  ParkCheckinsUseCase(this.baseHomeRepository);

  @override
  Future<(Failure?, ParkCheckInsResponse?)> call(
      ParkCheckInsParameters parameters) {
    return baseHomeRepository.parkCheckInsResponse(parameters);
  }
}

class ParkCheckInsParameters extends Equatable {
  final int parkId;

  const ParkCheckInsParameters({required this.parkId});

  @override
  List<Object?> get props => [parkId];
}
