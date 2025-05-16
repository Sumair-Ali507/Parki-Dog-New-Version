import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_mail_response.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_password_response.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_email_use_case.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_password_use_case.dart';

abstract class BaseSignInAndSecurityRemoteDataSource
    extends BaseAppRemoteDataSource {
  Future<ChangeEmailResponse> changeEmail(ChangeEmailParameters parameters);

  Future<ChangePasswordResponse> changePassword(
      ChangePasswordParameters parameters);
}

class SignInAndSecurityRemoteDataSource
    extends BaseSignInAndSecurityRemoteDataSource {
  @override
  Future<ChangeEmailResponse> changeEmail(
      ChangeEmailParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.changeMail}}',
        method: HttpMethod.post,
        fromJson: (data) => ChangeEmailResponse.fromJson(data));
  }

  @override
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.changePassword}}',
        method: HttpMethod.post,
        fromJson: (data) => ChangePasswordResponse.fromJson(data));
  }
}
