import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/auth/data/models/forgot_password_response.dart';
import 'package:parki_dog/features/auth/domain/repository/base_auth_repository.dart';

class ForgotPasswordUseCase
    extends BaseUseCase<ForgotPasswordResponse, ForgotPasswordParameters> {
  final BaseAuthRepository baseAuthRepository;

  ForgotPasswordUseCase(this.baseAuthRepository);

  @override
  Future<(Failure?, ForgotPasswordResponse?)> call(
      ForgotPasswordParameters parameters) {
    return baseAuthRepository.forgotPassword(parameters);
  }
}

class ForgotPasswordParameters extends Equatable {
  final String phoneNumber;

  const ForgotPasswordParameters({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}
