part of 'change_password_cubit.dart';

enum ChangePasswordStatus { initial, loading, success, error }

extension ChangePasswordStatusX on ChangePasswordStatus {
  bool get isInitial => this == ChangePasswordStatus.initial;

  bool get isLoading => this == ChangePasswordStatus.loading;

  bool get isSuccess => this == ChangePasswordStatus.success;

  bool get isError => this == ChangePasswordStatus.error;
}

class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;
  final String? error;
  final ChangePasswordResponse? changePasswordResponse;
  final bool passwordMatch;

  const ChangePasswordState({
    this.status = ChangePasswordStatus.initial,
    this.error,
    this.changePasswordResponse,
    this.passwordMatch = false,
  });

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    String? error,
    ChangePasswordResponse? changePasswordResponse,
    bool? passwordMatch,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      error: error ?? this.error,
      changePasswordResponse:
          changePasswordResponse ?? this.changePasswordResponse,
      passwordMatch: passwordMatch ?? this.passwordMatch,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, changePasswordResponse, passwordMatch];
}
// sealed class ChangePasswordState extends Equatable {
//   const ChangePasswordState();
// }
//
// final class ChangePasswordInitial extends ChangePasswordState {
//   @override
//   List<Object> get props => [];
// }
//
// class ChangePasswordLoading extends ChangePasswordState {
//   @override
//   List<Object> get props => [];
// }
//
// class ChangePasswordSuccess extends ChangePasswordState {
//   final ChangePasswordResponse changePasswordResponse;
//
//   const ChangePasswordSuccess({
//     required this.changePasswordResponse,
//   });
//
//   @override
//   List<Object> get props => [changePasswordResponse];
// }
//
// class ChangePasswordError extends ChangePasswordState {
//   final String error;
//
//   const ChangePasswordError({
//     required this.error,
//   });
//
//   @override
//   List<Object> get props => [error];
// }
//
// class NewPasswordMatch extends ChangePasswordState {
//   @override
//   List<Object> get props => [];
// }
//
// class NewPasswordMismatch extends ChangePasswordState {
//   @override
//   List<Object> get props => [];
// }
