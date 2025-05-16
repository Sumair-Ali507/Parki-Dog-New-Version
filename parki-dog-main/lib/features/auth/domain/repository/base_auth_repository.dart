import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/auth/data/models/forgot_password_response.dart';
import 'package:parki_dog/features/auth/data/models/login_response.dart';
import 'package:parki_dog/features/auth/data/models/signup_response.dart';
import 'package:parki_dog/features/auth/data/models/verify_email_response.dart';
import 'package:parki_dog/features/auth/domain/use_case/forgot_password_usecase.dart';
import 'package:parki_dog/features/auth/domain/use_case/login_use_case.dart';
import 'package:parki_dog/features/auth/domain/use_case/signup_use_case.dart';
import 'package:parki_dog/features/auth/domain/use_case/verify_email_usecase.dart';

abstract class BaseAuthRepository {
  Future<(Failure?, LoginResponse?)> login(LoginParameters parameters);
  Future<(Failure?, SignupResponse?)> signup(SignupParameters parameters);
  Future<(Failure?, VerifyEmailResponse?)> verifyEmail(
      VerifyEmailParameters parameters);
  Future<(Failure?, ForgotPasswordResponse?)> forgotPassword(
      ForgotPasswordParameters parameters);
}
