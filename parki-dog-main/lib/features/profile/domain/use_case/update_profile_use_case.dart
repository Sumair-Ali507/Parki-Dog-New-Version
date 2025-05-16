import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/profile/domain/repository/base_profile_repository.dart';

class UpdateProfileUseCase extends BaseUseCase<bool, UpdateProfileParameters> {
  final BaseProfileRepository baseProfileRepository;

  UpdateProfileUseCase(this.baseProfileRepository);

  @override
  Future<(Failure?, bool?)> call(
      UpdateProfileParameters parameters) {
    return baseProfileRepository.updateProfile(parameters);
  }
}

class UpdateProfileParameters extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? country;
  final List<double>? coordinates;
  final File? image;

  const UpdateProfileParameters({
    this.firstName,
    this.lastName,
    this.phone,
    this.country,
    this.coordinates,
    this.image,
  });

  @override
  List<Object?> get props =>
      [firstName, lastName, phone, country, coordinates, image];
}
