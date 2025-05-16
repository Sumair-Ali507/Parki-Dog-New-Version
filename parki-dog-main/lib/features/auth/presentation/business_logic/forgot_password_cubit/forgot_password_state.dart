part of 'forgot_password_cubit.dart';

enum ForgotPasswordStatus { initial, loading, success, error }

extension ForgotPasswordStatusX on ForgotPasswordStatus {
  bool get isInitial => this == ForgotPasswordStatus.initial;
  bool get isLoading => this == ForgotPasswordStatus.loading;
  bool get isSuccess => this == ForgotPasswordStatus.success;
  bool get isError => this == ForgotPasswordStatus.error;
}

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final String? error;
  final ForgotPasswordResponse? response;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.error,
    this.response,
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? error,
    ForgotPasswordResponse? response,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      error: error ?? this.error,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [status, error, response];
}

// final class ForgotPasswordInitial extends ForgotPasswordState {
//   @override
//   List<Object> get props => [];
// }
//
// class ForgotPasswordLoading extends ForgotPasswordState {
//   @override
//   List<Object> get props => [];
// }
//
// class ForgotPasswordSuccess extends ForgotPasswordState {
//   final ForgotPasswordResponse forgotPasswordResponse;
//
//   const ForgotPasswordSuccess({
//     required this.forgotPasswordResponse,
//   });
//
//   @override
//   List<Object> get props => [forgotPasswordResponse];
// }
//
// class ForgotPasswordError extends ForgotPasswordState {
//   final String error;
//
//   const ForgotPasswordError({
//     required this.error,
//   });
//
//   @override
//   List<Object> get props => [error];
// }
