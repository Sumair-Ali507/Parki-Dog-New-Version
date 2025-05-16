part of 'verify_mail_cubit.dart';

enum VerifyMailStatus {
  initial,
  loading,
  success,
  error,
}

extension VerifyMailStatusX on VerifyMailState {
  bool get isInitial => status == VerifyMailStatus.initial;
  bool get isLoading => status == VerifyMailStatus.loading;
  bool get isSuccess => status == VerifyMailStatus.success;
  bool get isError => status == VerifyMailStatus.error;
}

class VerifyMailState extends Equatable {
  final VerifyMailStatus status;
  final String error;
  final VerifyEmailResponse? verifyEmailResponse;

  const VerifyMailState({
    this.status = VerifyMailStatus.initial,
    this.error = '',
    this.verifyEmailResponse,
  });

  VerifyMailState copyWith({
    VerifyMailStatus? status,
    String? error,
    VerifyEmailResponse? verifyEmailResponse,
  }) {
    return VerifyMailState(
      status: status ?? this.status,
      error: error ?? this.error,
      verifyEmailResponse: verifyEmailResponse ?? this.verifyEmailResponse,
    );
  }

  @override
  List<Object?> get props => [status, error, verifyEmailResponse];
}
