import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parki_dog/features/dog_owner/data/models/dog_owner_info_response.dart';
import 'package:parki_dog/features/dog_owner/domain/use_case/submit_info_use_case.dart';

part 'submit_info_state.dart';

class SubmitInfoCubit extends Cubit<SubmitInfoState> {
  SubmitInfoUseCase submitInfoUseCase;

  SubmitInfoCubit(this.submitInfoUseCase) : super(const SubmitInfoState());

  submitInfo({
    required String fullName,
    required String gender,
    required String birthDate,
    required String phoneNumber,
    required String address,
    required String dogName,
    required String breed,
    required String dogGender,
    required String dogBirthDate,
    required double dogWeight,
    required int chipNumber,
  }) async {
    // emit(SubmitInfoLoading());
    emit(state.copyWith(status: SubmitInfoStatus.loading));
    final result = await submitInfoUseCase(InfoParameters(
      fullName: fullName,
      gender: gender,
      birthDate: birthDate,
      phoneNumber: phoneNumber,
      address: address,
      dogName: dogName,
      breed: breed,
      dogGender: dogGender,
      dogBirthDate: dogBirthDate,
      dogWeight: dogWeight,
      chipNumber: chipNumber,
    ));
    if (result.$1 != null) {
      // emit(SubmitInfoError(error: result.$1!.message));
      emit(state.copyWith(
          status: SubmitInfoStatus.error, error: result.$1!.message));
    } else {
      // emit(SubmitInfoSuccess(dogOwnerInfoResponse: result.$2!));
      emit(state.copyWith(
          status: SubmitInfoStatus.success, dogOwnerInfoResponse: result.$2!));
    }
  }
}
