import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:parki_dog/features/auth/data/models/forgot_password_response.dart';
import 'package:parki_dog/features/auth/data/models/login_response.dart';
import 'package:parki_dog/features/auth/data/models/signup_response.dart';
import 'package:parki_dog/features/auth/data/models/verify_email_response.dart';
import 'package:parki_dog/features/auth/domain/repository/base_auth_repository.dart';
import 'package:parki_dog/features/auth/domain/use_case/forgot_password_usecase.dart';
import 'package:parki_dog/features/auth/domain/use_case/login_use_case.dart';
import 'package:dio/dio.dart';
import 'package:parki_dog/features/auth/domain/use_case/signup_use_case.dart';
import 'package:parki_dog/features/auth/domain/use_case/verify_email_usecase.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  @override
  Future<(Failure?, LoginResponse?)> login(LoginParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.login(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (
        ErrorHandler.handle(error).failure,
        null
      ); // Failure, return null LoginResponse
    }
  }

  @override
  Future<(Failure?, SignupResponse?)> signup(
      SignupParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.signup(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, ForgotPasswordResponse?)> forgotPassword(
      ForgotPasswordParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.forgotPassword(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, VerifyEmailResponse?)> verifyEmail(
      VerifyEmailParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.verifyEmail(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
