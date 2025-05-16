import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_mail_response.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/repository/base_sign_in_and_security_repository.dart';

class ChangeEmailUseCase
    extends BaseUseCase<ChangeEmailResponse, ChangeEmailParameters> {
  final BaseSignInAndSecurityRepository baseSignInAndSecurityRepository;

  ChangeEmailUseCase(this.baseSignInAndSecurityRepository);

  @override
  Future<(Failure?, ChangeEmailResponse?)> call(
      ChangeEmailParameters parameters) {
    return baseSignInAndSecurityRepository.changeEmail(parameters);
  }
}

class ChangeEmailParameters extends Equatable {
  final String email;
  final String password;

  const ChangeEmailParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
