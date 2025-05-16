import 'package:parki_dog/features/dog_owner/export//dog_owner_export.dart';

SignupRequestBody registrationBody(DogOwnerProcessModel model) {
  return SignupRequestBody(
    firstName: model.firstName,
    lastName: model.lastName,
    email: model.email,
    password: model.password,
    passwordConfirm: model.password,
    phone: model.phoneNumber,
    country: model.country,
    location: LocationRequestBody(coordinates: model.coordinates),
    ownedDogs: [
      OwnedDogsRequestBody(
        name: model.dogName,
        breed: model.breed?.name,
        age: _calculateDogAge(model.dogBirthDate),
        gender: model.dogGender?.name.tr(),
        weight: model.dogWeight,
        unsociability: _createUnsociabilityRequestBody(
            model), // Set based on additional requirements if needed
      ),
    ],
  );
}

UnsociabilityRequestBody? _createUnsociabilityRequestBody(
    DogOwnerProcessModel model) {
  List<String>? breeds = model.breedsUnsociability;
  List<String>? genders = model.gendersUnsociability;
  double? minWeight = model.minWeightUnsociability;

  // Return null if all values are null
  if (breeds == null && genders == null && minWeight == null) {
    return null;
  }

  // Return UnsociabilityRequestBody with non-null fields
  return UnsociabilityRequestBody(
    breeds: breeds,
    genders: genders,
    minWeight: minWeight,
  );
}

// Helper function to calculate age based on birth date
int _calculateDogAge(DateTime? birthDate) {
  if (birthDate == null) return 0;
  final currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }
  return age;
}
