import 'package:dio/dio.dart';
import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/sign_in_and_security/data/datasource/base_sign_in_and_security_remote_data_source.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_mail_response.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_password_response.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/repository/base_sign_in_and_security_repository.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_email_use_case.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_password_use_case.dart';

class SignInAndSecurityRepository extends BaseSignInAndSecurityRepository {
  final BaseSignInAndSecurityRemoteDataSource
      baseSignInAndSecurityRemoteDataSource;

  SignInAndSecurityRepository(this.baseSignInAndSecurityRemoteDataSource);

  @override
  Future<(Failure?, ChangeEmailResponse?)> changeEmail(
      ChangeEmailParameters parameters) async {
    try {
      final result =
          await baseSignInAndSecurityRemoteDataSource.changeEmail(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, ChangePasswordResponse?)> changePassword(
      ChangePasswordParameters parameters) async {
    try {
      final result = await baseSignInAndSecurityRemoteDataSource
          .changePassword(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
