import 'package:parki_dog/features/profile/domain/use_case/update_profile_use_case.dart';
import 'package:parki_dog/features/profile/export/profile_export.dart';

part 'edit_contact_info_state.dart';

class EditContactInfoCubit extends Cubit<EditContactInfoState> {
  UpdateProfileUseCase updateProfileUseCase;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final contactInfoGormKey = GlobalKey<FormState>();
  void updateInfoProcess({
    String? phoneNumber,
    String? dialCode,
    String? address,
    List<double>? coordinates,
    String? country,


  }) {
    emit(state.copyWith(
      phoneNumber: phoneNumber ?? state.phoneNumber,
      dialCode: dialCode ?? state.dialCode,
      address: address ?? state.address,
      coordinates: coordinates ?? state.coordinates,
      country: country ?? state.country
    ));
  }
  init(Profile? profile){
    phoneNumberController.text = profile?.phone??'';
  }

  EditContactInfoCubit(this.updateProfileUseCase) : super(const EditContactInfoState());
  save() async {
    emit(state.copyWith(status: EditContactInfoStatus.loading));
    final result = await updateProfileUseCase(UpdateProfileParameters(phone: '${state.dialCode}${state.phoneNumber}',
        country: state.country,
        coordinates: state.coordinates));
    if (result.$1 != null) {
      emit(state.copyWith(
        status: EditContactInfoStatus.error,
        error: result.$1!.message.tr(),
      ));
    } else {
      emit(state.copyWith(status: EditContactInfoStatus.success, editResponse: true));
    }
  }
  @override
  Future<void> close() {
    phoneNumberController.dispose();
    addressController.dispose();
    return super.close();
  }
}
