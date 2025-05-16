part of 'edit_contact_info_cubit.dart';


enum EditContactInfoStatus {
  initial,
  loading,
  success,
  error,
}

extension EditContactInfoStatusX on EditContactInfoState {
  bool get isInitial => status == EditContactInfoStatus.initial;

  bool get isLoading => status == EditContactInfoStatus.loading;

  bool get isSuccess => status == EditContactInfoStatus.success;

  bool get isError => status == EditContactInfoStatus.error;
}

class EditContactInfoState extends Equatable {
  final EditContactInfoStatus status;
  final String error;
  final bool? editResponse;
  final String? phoneNumber;
  final String? dialCode;
  final String? address;
  final List<double>? coordinates;
  final     String? country;


  const EditContactInfoState({
    this.status = EditContactInfoStatus.initial,
    this.error = '',
    this.editResponse,
    this.phoneNumber,
    this.dialCode,
    this.address,
    this.coordinates,
    this.country
  });

  EditContactInfoState copyWith({
    EditContactInfoStatus? status,
    String? error,
    bool? editResponse,
    String? phoneNumber,
    String? dialCode,
    String? address,
    List<double>? coordinates,
    String? country,


  }) {
    return EditContactInfoState(
      status: status ?? this.status,
      error: error ?? this.error,
      editResponse: editResponse ?? this.editResponse,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dialCode: dialCode ?? this.dialCode,
      address: address ?? this.address,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country
    );
  }

  @override
  List<Object?> get props => [
    status,
    error,
    editResponse,
    phoneNumber,
    dialCode,
    address,
    coordinates,
    country,
  ];
}
