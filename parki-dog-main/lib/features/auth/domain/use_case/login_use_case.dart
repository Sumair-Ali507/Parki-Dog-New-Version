import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/auth/data/models/login_response.dart';
import 'package:parki_dog/features/auth/domain/repository/base_auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase extends BaseUseCase<LoginResponse, LoginParameters> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  @override
  Future<(Failure?, LoginResponse?)> call(LoginParameters parameters) {
    return baseAuthRepository.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
