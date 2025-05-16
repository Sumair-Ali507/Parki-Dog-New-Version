import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/auth/data/models/forgot_password_response.dart';
import 'package:parki_dog/features/auth/data/models/login_response.dart';
import 'package:parki_dog/features/auth/data/models/signup_response.dart';
import 'package:parki_dog/features/auth/data/models/verify_email_response.dart';
import 'package:parki_dog/features/auth/domain/use_case/forgot_password_usecase.dart';
import 'package:parki_dog/features/auth/domain/use_case/login_use_case.dart';
import 'package:parki_dog/features/auth/domain/use_case/signup_use_case.dart';
import 'package:parki_dog/features/auth/domain/use_case/verify_email_usecase.dart';

abstract class BaseAuthRemoteDataSource extends BaseAppRemoteDataSource {
  Future<LoginResponse> login(LoginParameters parameters);
  Future<SignupResponse> signup(SignupParameters parameters);
  Future<VerifyEmailResponse> verifyEmail(VerifyEmailParameters parameters);
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordParameters parameters);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<LoginResponse> login(LoginParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.login,
        method: HttpMethod.post,
        body: {'email': parameters.email, 'password': parameters.password},
        fromJson: (data) => LoginResponse.fromJson(data));
  }

  @override
  Future<SignupResponse> signup(SignupParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.signup,
        method: HttpMethod.post,
        body: parameters.body,
        fromJson: (data) => SignupResponse.fromJson(data));
  }

  @override
  Future<VerifyEmailResponse> verifyEmail(
      VerifyEmailParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.verifyEmail}/${parameters.code}',
        method: HttpMethod.post,
        fromJson: (data) => VerifyEmailResponse.fromJson(data));
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.forgotPassword}}',
        method: HttpMethod.post,
        fromJson: (data) => ForgotPasswordResponse.fromJson(data));
  }
}
