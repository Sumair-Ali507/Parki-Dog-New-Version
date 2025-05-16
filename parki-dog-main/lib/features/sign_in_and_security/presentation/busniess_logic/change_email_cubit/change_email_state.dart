part of 'change_email_cubit.dart';

enum ChangeEmailStatus { initial, loading, success, error }

extension ChangeEmailStatusX on ChangeEmailStatus {
  bool get isInitial => this == ChangeEmailStatus.initial;

  bool get isLoading => this == ChangeEmailStatus.loading;

  bool get isSuccess => this == ChangeEmailStatus.success;

  bool get isError => this == ChangeEmailStatus.error;
}

class ChangeEmailState extends Equatable {
  final ChangeEmailStatus status;
  final String? error;
  final ChangeEmailResponse? changeEmailResponse;

  const ChangeEmailState({
    this.status = ChangeEmailStatus.initial,
    this.error,
    this.changeEmailResponse,
  });

  ChangeEmailState copyWith({
    ChangeEmailStatus? status,
    String? error,
    ChangeEmailResponse? changeEmailResponse,
  }) {
    return ChangeEmailState(
      status: status ?? this.status,
      error: error ?? this.error,
      changeEmailResponse: changeEmailResponse ?? this.changeEmailResponse,
    );
  }

  @override
  List<Object?> get props => [status, error, changeEmailResponse];
}
//
// sealed class ChangeEmailState extends Equatable {
//   const ChangeEmailState();
// }
//
// final class ChangeEmailInitial extends ChangeEmailState {
//   @override
//   List<Object> get props => [];
// }
//
// class ChangeEmailLoading extends ChangeEmailState {
//   @override
//   List<Object> get props => [];
// }
//
// class ChangeEmailSuccess extends ChangeEmailState {
//   final ChangeEmailResponse changeEmailResponse;
//
//   const ChangeEmailSuccess({
//     required this.changeEmailResponse,
//   });
//
//   @override
//   List<Object> get props => [changeEmailResponse];
// }
//
// class ChangeEmailError extends ChangeEmailState {
//   final String error;
//
//   const ChangeEmailError({
//     required this.error,
//   });
//
//   @override
//   List<Object> get props => [error];
// }
