import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/auth/data/models/verify_email_response.dart';
import 'package:parki_dog/features/auth/domain/repository/base_auth_repository.dart';

class VerifyEmailUseCase
    extends BaseUseCase<VerifyEmailResponse, VerifyEmailParameters> {
  final BaseAuthRepository baseAuthRepository;

  VerifyEmailUseCase(this.baseAuthRepository);

  @override
  Future<(Failure?, VerifyEmailResponse?)> call(
      VerifyEmailParameters parameters) {
    return baseAuthRepository.verifyEmail(parameters);
  }
}

class VerifyEmailParameters extends Equatable {
  final String code;

  const VerifyEmailParameters({required this.code});

  @override
  List<Object> get props => [code];
}
