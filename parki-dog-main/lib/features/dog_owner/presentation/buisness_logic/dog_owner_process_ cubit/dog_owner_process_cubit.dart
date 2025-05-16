import 'package:parki_dog/core/shared_widgets/choose_condtion_dialog/business_logic/choose_condition_bloc.dart';
import 'package:parki_dog/features/dog_owner/export//dog_owner_export.dart';

class DogOwnerProcessCubit extends Cubit<DogOwnerProcessModel> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dogNameController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController dogGenderController = TextEditingController();
  final TextEditingController dogBirthDateController = TextEditingController();
  final TextEditingController dogWeightController = TextEditingController();
  final TextEditingController chipNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController breedsUnsociabilityController =
      TextEditingController();
  final TextEditingController gendersUnsociabilityController =
      TextEditingController();
  final TextEditingController weightUnsociabilityController =
      TextEditingController();
  final TextEditingController reTypePasswordController =
      TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final basicInfoGormKey = GlobalKey<FormState>();
  final dogInfoGormKey = GlobalKey<FormState>();
  // final unsociabilityFormKey = GlobalKey<FormState>();

  DogOwnerProcessCubit() : super(DogOwnerProcessModel());

  void updateDogOwnerProcess({
    String? firstName,
    String? lastName,
    Gender? gender,
    DateTime? birthDate,
    String? phoneNumber,
    String? dialCode,
    String? address,
    String? dogName,
    Breed? breed,
    Gender? dogGender,
    DateTime? dogBirthDate,
    double? dogWeight,
    int? chipNumber,
    File? imageFile,
    File? dogImageFile,
    List<String>? breedsUnsociability,
    List<String>? gendersUnsociability,
    double? minWeightUnsociability,
    Condition? conditionUnsociability,
    List<double>? coordinates,
    String? country,
    String? email,
    String? password,
    bool? passwordMatch,
  }) {
    emit(state.copyWith(
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      gender: gender ?? state.gender,
      birthDate: birthDate ?? state.birthDate,
      phoneNumber: phoneNumber ?? state.phoneNumber,
      dialCode: dialCode ?? state.dialCode,
      address: address ?? state.address,
      dogName: dogName ?? state.dogName,
      breed: breed ?? state.breed,
      dogGender: dogGender ?? state.dogGender,
      dogBirthDate: dogBirthDate ?? state.dogBirthDate,
      dogWeight: dogWeight ?? state.dogWeight,
      chipNumber: chipNumber ?? state.chipNumber,
      imageFile: imageFile ?? state.imageFile,
      dogImageFile: dogImageFile ?? state.dogImageFile,
      breedsUnsociability: breedsUnsociability ?? state.breedsUnsociability,
      gendersUnsociability: gendersUnsociability ?? state.gendersUnsociability,
      minWeightUnsociability:
          minWeightUnsociability ?? state.minWeightUnsociability,
      conditionUnSociability:
          conditionUnsociability ?? state.conditionUnSociability,
      coordinates: coordinates ?? state.coordinates,
      country: country ?? state.country,
      email: email ?? state.email,
      password: password ?? state.password,
      passwordMatch: passwordMatch ?? state.passwordMatch,
    ));
  }

  // Password matching logic
  void checkPasswordMatch() {
    if (passwordController.text == reTypePasswordController.text) {
      // emit(PasswordMatch());
      emit(state.copyWith(passwordMatch: true));
    } else {
      // emit(PasswordMismatch());
      emit(state.copyWith(passwordMatch: false));
    }
  }

  Future<void> pickDogOwnerImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      updateDogOwnerProcess(imageFile: File(image.path));
    }
  }

  Future<void> pickDogImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      updateDogOwnerProcess(dogImageFile: File(image.path));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    dogNameController.dispose();
    breedController.dispose();
    dogGenderController.dispose();
    dogBirthDateController.dispose();
    dogWeightController.dispose();
    chipNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    reTypePasswordController.dispose();
    breedsUnsociabilityController.dispose();
    gendersUnsociabilityController.dispose();
    weightUnsociabilityController.dispose();
    return super.close();
  }
}
