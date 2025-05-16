import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_mail_response.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_password_response.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_email_use_case.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_password_use_case.dart';

abstract class BaseSignInAndSecurityRepository {
  Future<(Failure?, ChangeEmailResponse?)> changeEmail(
      ChangeEmailParameters parameters);
  Future<(Failure?, ChangePasswordResponse?)> changePassword(
      ChangePasswordParameters parameters);
}
