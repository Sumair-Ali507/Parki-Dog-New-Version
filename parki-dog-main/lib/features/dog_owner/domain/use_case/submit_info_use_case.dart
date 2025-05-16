import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/dog_owner/data/models/dog_owner_info_response.dart';
import 'package:parki_dog/features/dog_owner/domain/repository/base_dog_owner_repository.dart';

class SubmitInfoUseCase
    extends BaseUseCase<DogOwnerInfoResponse, InfoParameters> {
  final BaseDogOwnerRepository baseDogInfoRepository;

  SubmitInfoUseCase(this.baseDogInfoRepository);

  @override
  Future<(Failure?, DogOwnerInfoResponse?)> call(InfoParameters parameters) {
    return baseDogInfoRepository.submitInfo(parameters);
  }
}

class InfoParameters extends Equatable {
  final String fullName;
  final String gender;
  final String birthDate;
  final String phoneNumber;
  final String address;
  final String dogName;
  final String breed;
  final String dogGender;
  final String dogBirthDate;
  final double dogWeight;
  final int chipNumber;

  const InfoParameters(
      {required this.fullName,
      required this.gender,
      required this.birthDate,
      required this.phoneNumber,
      required this.address,
      required this.dogName,
      required this.breed,
      required this.dogGender,
      required this.dogBirthDate,
      required this.dogWeight,
      required this.chipNumber});

  @override
  List<Object?> get props => [
        fullName,
        gender,
        birthDate,
        phoneNumber,
        address,
        dogName,
        breed,
        dogGender,
        dogBirthDate,
        dogWeight,
        chipNumber
      ];
}
