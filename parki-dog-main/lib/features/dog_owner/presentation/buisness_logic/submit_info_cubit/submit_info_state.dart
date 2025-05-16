part of 'submit_info_cubit.dart';

enum SubmitInfoStatus { initial, loading, success, error }

extension SubmitInfoStatusX on SubmitInfoStatus {
  bool get isInitial => this == SubmitInfoStatus.initial;
  bool get isLoading => this == SubmitInfoStatus.loading;
  bool get isSuccess => this == SubmitInfoStatus.success;
  bool get isError => this == SubmitInfoStatus.error;
}

class SubmitInfoState extends Equatable {
  final SubmitInfoStatus status;
  final String? error;
  final DogOwnerInfoResponse? dogOwnerInfoResponse;

  const SubmitInfoState({
    this.status = SubmitInfoStatus.initial,
    this.error,
    this.dogOwnerInfoResponse,
  });

  SubmitInfoState copyWith({
    SubmitInfoStatus? status,
    String? error,
    DogOwnerInfoResponse? dogOwnerInfoResponse,
  }) {
    return SubmitInfoState(
      status: status ?? this.status,
      error: error ?? this.error,
      dogOwnerInfoResponse: dogOwnerInfoResponse ?? this.dogOwnerInfoResponse,
    );
  }

  @override
  List<Object?> get props => [status, error, dogOwnerInfoResponse];
}
// sealed class SubmitInfoState extends Equatable {
//   const SubmitInfoState();
// }
//
// final class SubmitInfoInitial extends SubmitInfoState {
//   @override
//   List<Object> get props => [];
// }
//
// class SubmitInfoLoading extends SubmitInfoState {
//   @override
//   List<Object> get props => [];
// }
//
// class SubmitInfoSuccess extends SubmitInfoState {
//   final DogOwnerInfoResponse dogOwnerInfoResponse;
//
//   const SubmitInfoSuccess({
//     required this.dogOwnerInfoResponse,
//   });
//
//   @override
//   List<Object> get props => [dogOwnerInfoResponse];
// }
//
// class SubmitInfoError extends SubmitInfoState {
//   final String error;
//
//   const SubmitInfoError({
//     required this.error,
//   });
//
//   @override
//   List<Object> get props => [error];
// }
