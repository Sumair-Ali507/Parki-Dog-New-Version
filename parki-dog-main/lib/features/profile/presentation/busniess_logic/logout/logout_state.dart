part of 'logout_cubit.dart';

enum LogoutStatus {
  initial,
  loading,
  success,
  error,
}

extension LogoutStatusX on LogoutState {
  bool get isInitial => status == LogoutStatus.initial;
  bool get isLoading => status == LogoutStatus.loading;
  bool get isSuccess => status == LogoutStatus.success;
  bool get isError => status == LogoutStatus.error;
}

class LogoutState extends Equatable {
  final LogoutStatus status;
  final String error;
  final LogoutResponse? logoutResponse;

  const LogoutState({
    this.status = LogoutStatus.initial,
    this.error = '',
    this.logoutResponse,
  });

  LogoutState copyWith({
    LogoutStatus? status,
    String? error,
    LogoutResponse? logoutResponse,
  }) {
    return LogoutState(
      status: status ?? this.status,
      error: error ?? this.error,
      logoutResponse: logoutResponse ?? this.logoutResponse,
    );
  }

  @override
  List<Object?> get props => [status, error, logoutResponse];
}
