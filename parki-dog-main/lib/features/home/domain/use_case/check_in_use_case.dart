import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/home/data/models/checkin.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';

class CheckInUseCase extends BaseUseCase<CheckIn, CheckInParameters> {
  final BaseHomeRepository baseHomeRepository;

  CheckInUseCase(this.baseHomeRepository);

  @override
  Future<(Failure?, CheckIn?)> call(CheckInParameters parameters) {
    return baseHomeRepository.checkIn(parameters);
  }
}

class CheckInParameters extends Equatable {
  final int parkId;
  final int dogId;

  const CheckInParameters({required this.parkId, required this.dogId});

  @override
  List<Object?> get props => [parkId, dogId];
}
