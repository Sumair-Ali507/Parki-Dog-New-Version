part of 'login_cubit.dart';

enum LoginStatus1 { initial, loading, success, error }

extension LoginStatusX on LoginState {
  bool get isInitial => status == LoginStatus1.initial;
  bool get isLoading => status == LoginStatus1.loading;
  bool get isSuccess => status == LoginStatus1.success;
  bool get isError => status == LoginStatus1.error;
}

class LoginState extends Equatable {
  final LoginStatus1 status;
  final LoginResponse? response;
  final String? error;

  const LoginState({
    this.status = LoginStatus1.initial,
    this.response,
    this.error,
  });

  LoginState copyWith({
    LoginStatus1? status,
    LoginResponse? response,
    String? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      response: response ?? this.response,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, response, error];
}
