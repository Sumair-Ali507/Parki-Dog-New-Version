import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/auth/data/models/signup_response.dart';
import 'package:parki_dog/features/auth/domain/repository/base_auth_repository.dart';

class SignupUseCase extends BaseUseCase<SignupResponse, SignupParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignupUseCase(this.baseAuthRepository);

  @override
  Future<(Failure?, SignupResponse?)> call(SignupParameters parameters) {
    return baseAuthRepository.signup(parameters);
  }
}

class SignupParameters extends Equatable {
  final Map<String, dynamic> body;

  const SignupParameters({required this.body});

  @override
  List<Object> get props => [body];
}
