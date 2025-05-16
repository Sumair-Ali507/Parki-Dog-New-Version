import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_password_response.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/repository/base_sign_in_and_security_repository.dart';

class ChangePasswordUseCase
    extends BaseUseCase<ChangePasswordResponse, ChangePasswordParameters> {
  final BaseSignInAndSecurityRepository baseSignInAndSecurityRepository;

  ChangePasswordUseCase(this.baseSignInAndSecurityRepository);

  @override
  Future<(Failure?, ChangePasswordResponse?)> call(
      ChangePasswordParameters parameters) {
    return baseSignInAndSecurityRepository.changePassword(parameters);
  }
}

class ChangePasswordParameters extends Equatable {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParameters({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword];
}
