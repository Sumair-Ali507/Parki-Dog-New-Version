import 'dart:io';

import 'package:parki_dog/core/shared_widgets/choose_condtion_dialog/business_logic/choose_condition_bloc.dart';
import 'package:parki_dog/core/shared_widgets/gender_selection_widget.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';

class DogOwnerProcessModel {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final Gender? gender;
  final DateTime? birthDate;
  final String? phoneNumber;
  final String? dialCode;
  final String? country;
  final List<double>? coordinates;
  final String? address;
  final String? dogName;
  final Breed? breed;
  final Gender? dogGender;
  final DateTime? dogBirthDate;
  final double? dogWeight;
  final List<String>? breedsUnsociability;
  final List<String>? gendersUnsociability;
  final double? minWeightUnsociability;
  final int? chipNumber;
  final File? imageFile;
  final File? dogImageFile;
  final bool passwordMatch;
  final List<Breed>? breedsUnSociability;
  final List<Gender>? gendersUnSociability;
  final double? weightUnSociability;
  final Condition conditionUnSociability;

  DogOwnerProcessModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.phoneNumber,
    this.dialCode,
    this.country,
    this.coordinates,
    this.address,
    this.dogName,
    this.breed,
    this.dogGender,
    this.dogBirthDate,
    this.dogWeight,
    this.breedsUnsociability,
    this.gendersUnsociability,
    this.minWeightUnsociability,
    this.chipNumber,
    this.imageFile,
    this.dogImageFile,
    this.passwordMatch = false,
    this.conditionUnSociability = Condition.greaterThan,
    this.breedsUnSociability,
    this.gendersUnSociability,
    this.weightUnSociability,
  });

  DogOwnerProcessModel copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    Gender? gender,
    DateTime? birthDate,
    String? phoneNumber,
    String? dialCode,
    String? country,
    List<double>? coordinates,
    String? address,
    String? dogName,
    Breed? breed,
    Gender? dogGender,
    DateTime? dogBirthDate,
    double? dogWeight,
    List<String>? breedsUnsociability,
    List<String>? gendersUnsociability,
    double? minWeightUnsociability,
    int? chipNumber,
    File? imageFile,
    File? dogImageFile,
    bool? passwordMatch,
    List<Breed>? breedsUnSociability,
    List<Gender>? gendersUnSociability,
    double? weightUnSociability,
    Condition? conditionUnSociability,
  }) {
    return DogOwnerProcessModel(
        email: email ?? this.email,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dialCode: dialCode ?? this.dialCode,
        country: country ?? this.country,
        coordinates: coordinates ?? this.coordinates,
        address: address ?? this.address,
        dogName: dogName ?? this.dogName,
        breed: breed ?? this.breed,
        dogGender: dogGender ?? this.dogGender,
        dogBirthDate: dogBirthDate ?? this.dogBirthDate,
        dogWeight: dogWeight ?? this.dogWeight,
        breedsUnsociability: breedsUnsociability ?? this.breedsUnsociability,
        gendersUnsociability: gendersUnsociability ?? this.gendersUnsociability,
        minWeightUnsociability:
            minWeightUnsociability ?? this.minWeightUnsociability,
        chipNumber: chipNumber ?? this.chipNumber,
        imageFile: imageFile ?? this.imageFile,
        dogImageFile: dogImageFile ?? this.dogImageFile,
        passwordMatch: passwordMatch ?? this.passwordMatch,
        breedsUnSociability: breedsUnSociability ?? this.breedsUnSociability,
        gendersUnSociability: gendersUnSociability ?? this.gendersUnSociability,
        weightUnSociability: weightUnSociability ?? this.weightUnSociability,
        conditionUnSociability:
            conditionUnSociability ?? this.conditionUnSociability);
  }

  @override
  String toString() {
    return 'DogOwnerProcessModel{email: $email, password: $password, firstName: $firstName, lastName: $lastName, gender: $gender, birthDate: $birthDate, phoneNumber: $phoneNumber, dialCode: $dialCode, country: $country, coordinates: $coordinates, address: $address, dogName: $dogName, breed: $breed, dogGender: $dogGender, dogBirthDate: $dogBirthDate, dogWeight: $dogWeight, breedsUnsociability: $breedsUnsociability, gendersUnsociability: $gendersUnsociability, minWeightUnsociability: $minWeightUnsociability, chipNumber: $chipNumber, imageFile: $imageFile, dogImageFile: $dogImageFile, passwordMatch: $passwordMatch, breedsUnSociability: $breedsUnSociability, gendersUnSociability: $gendersUnSociability, weightUnSociability: $weightUnSociability, conditionUnSociability: $conditionUnSociability}';
  }
}
