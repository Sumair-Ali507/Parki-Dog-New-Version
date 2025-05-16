import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/core/routes/routes_export.dart';
import 'package:parki_dog/features/profile/domain/repository/base_profile_repository.dart';

class UpdateDogUseCase
    extends BaseUseCase<ProfileResponse, UpdateDogParameters> {
  final BaseProfileRepository baseProfileRepository;

  UpdateDogUseCase(this.baseProfileRepository);

  @override
  Future<(Failure?, ProfileResponse?)> call(UpdateDogParameters parameters) {
    return baseProfileRepository.updateDog(parameters);
  }
}

class UpdateDogParameters extends Equatable {
  final String dogId;
  final String? name;
  final String? breed;
  final int? age;
  final String? gender;
  final double? weight;

  const UpdateDogParameters({
    required this.dogId,
    this.name,
    this.breed,
    this.age,
    this.gender,
    this.weight,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'breed': breed,
        'age': age,
        'gender': gender,
        'weight': weight,
      };

  @override
  List<Object?> get props => [dogId, name, breed, age, gender, weight];
}
