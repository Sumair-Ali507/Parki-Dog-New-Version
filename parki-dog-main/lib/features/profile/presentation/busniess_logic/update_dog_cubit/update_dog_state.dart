part of 'update_dog_cubit.dart';


enum UpdateDogStatus {
  initial,
  loading,
  success,
  error,
}

extension UpdateDogStatusX on UpdateDogState {
  bool get isInitial => status == UpdateDogStatus.initial;

  bool get isLoading => status == UpdateDogStatus.loading;

  bool get isSuccess => status == UpdateDogStatus.success;

  bool get isError => status == UpdateDogStatus.error;
}

class UpdateDogState extends Equatable {
  final UpdateDogStatus status;
  final String error;
  final bool? editResponse;

  final String? dogName;
  final Breed? breed;
  final DateTime? dogBirthDate;
  final Gender? dogGender;
  final double? dogWeight;

  const UpdateDogState({
    this.status = UpdateDogStatus.initial,
    this.error = '',
    this.editResponse,
    this.dogName,
    this.breed,
    this.dogBirthDate,
    this.dogGender,
    this.dogWeight,
  });

  UpdateDogState copyWith({
    UpdateDogStatus? status,
    String? error,
    bool? editResponse,
    String? dogName,
    Breed? breed,
    DateTime? dogBirthDate,
    Gender? dogGender,
    double? dogWeight,
  }) {
    return UpdateDogState(
      status: status ?? this.status,
      error: error ?? this.error,
      editResponse: editResponse ?? this.editResponse,
      dogName: dogName ?? this.dogName,
      breed: breed ?? this.breed,
      dogBirthDate: dogBirthDate ?? this.dogBirthDate,
      dogGender: dogGender ?? this.dogGender,
      dogWeight: dogWeight ?? this.dogWeight,
    );
  }

  @override
  List<Object?> get props =>
      [
        status,
        error,
        editResponse,
        dogName,
        breed,
        dogBirthDate,
        dogGender,
        dogWeight
      ];
}