import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/shared_widgets/gender_selection_widget.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';
import 'package:parki_dog/features/profile/data/models/profile_response.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_dog_use_case.dart';
import 'package:flutter/material.dart';
part 'update_dog_state.dart';

class UpdateDogCubit extends Cubit<UpdateDogState> {
  UpdateDogCubit(this.updateDogUseCase) : super(const UpdateDogState());

  UpdateDogUseCase updateDogUseCase;
  final TextEditingController dogNameController = TextEditingController();

  final TextEditingController breedController = TextEditingController();

  final TextEditingController dogGenderController = TextEditingController();

  final TextEditingController dogBirthDateController = TextEditingController();

  final TextEditingController dogWeightController = TextEditingController();

  final updateDogFormKey = GlobalKey<FormState>();
  void updateInfoProcess({
    String? dogName,
    Breed? breed,
    Gender? dogGender,
    DateTime? dogBirthDate,
    double? dogWeight,
  }) {
    emit(state.copyWith(
      dogName: dogName ?? state.dogName,
      breed: breed ?? state.breed,
      dogGender: dogGender ?? state.dogGender,
      dogBirthDate: dogBirthDate ?? state.dogBirthDate,
      dogWeight: dogWeight ?? state.dogWeight,
    ));
  }
  init(Profile? profile){
    dogNameController.text = profile?.ownedDogs?.first.name??'';
    breedController.text =profile?.ownedDogs?.first.breed??'';
    dogGenderController.text = profile?.ownedDogs?.first.gender??'';
    dogBirthDateController.text = calculateBirthdateFromAge(profile?.ownedDogs?.first.age).toString();
  }

  DateTime calculateBirthdateFromAge(int? age) {
    if(age!=null){
      final now = DateTime.now();
      final birthYear = now.year - age;
      return DateTime(birthYear, 1, 1); // 1st January of that year
    }else{
      return DateTime.now();
    }

  }


  int calculateAge(DateTime? birthDate) {
    if(birthDate!=null){
      final now = DateTime.now();
      int age = now.year - birthDate.year;

      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        age--; // Birthday hasn't occurred yet this year.
      }
      return age;
    }


    return 0;
  }


  save(String dogId) async {
    emit(state.copyWith(status: UpdateDogStatus.loading));
    final result = await updateDogUseCase(UpdateDogParameters(name: dogNameController.text,
        breed: breedController.text,
      dogId: dogId,
      age: calculateAge(state.dogBirthDate),
      gender: dogGenderController.text,
      weight: double.parse(dogWeightController.text),
    ));
    if (result.$1 != null) {
      emit(state.copyWith(
        status: UpdateDogStatus.error,
        error: result.$1!.message.tr(),
      ));
    } else {
      emit(state.copyWith(status: UpdateDogStatus.success, editResponse: true));
    }
  }



  @override
  Future<void> close() {
    dogNameController.dispose();
    breedController.dispose();
    dogGenderController.dispose();
    dogBirthDateController.dispose();
    dogWeightController.dispose();
    return super.close();
  }
}
