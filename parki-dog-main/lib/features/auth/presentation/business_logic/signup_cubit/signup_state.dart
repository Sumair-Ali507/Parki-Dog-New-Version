part of 'signup_cubit.dart';

enum SignupStatus {
  loading,
  success,
  error,
}

extension SignupStatusX on SignupState {
  bool get isLoading => status == SignupStatus.loading;

  bool get isSuccess => status == SignupStatus.success;

  bool get isError => status == SignupStatus.error;
}

class SignupState extends Equatable {
  final SignupStatus status;
  final String error;
  final SignupResponse? signupResponse;
  final bool fromX;
  final bool fromNotNow;
  final bool fromSubmit;

  const SignupState(
      {this.status = SignupStatus.loading,
      this.error = '',
      this.signupResponse,
      this.fromX = false,
      this.fromNotNow = false,
      this.fromSubmit = false});

  SignupState copyWith(
      {SignupStatus? status,
      String? error,
      SignupResponse? signupResponse,
      bool? fromX,
      bool? fromNotNow,
      bool? fromSubmit}) {
    return SignupState(
        status: status ?? this.status,
        error: error ?? this.error,
        signupResponse: signupResponse ?? this.signupResponse,
        fromX: fromX ?? this.fromX,
        fromNotNow: fromNotNow ?? this.fromNotNow,
        fromSubmit: fromSubmit ?? this.fromSubmit);
  }

  @override
  List<Object?> get props =>
      [status, error, signupResponse, fromX, fromNotNow, fromSubmit];
}
