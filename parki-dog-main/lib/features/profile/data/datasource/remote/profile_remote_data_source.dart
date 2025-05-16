import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/profile/data/models/logout_response.dart';
import 'package:parki_dog/features/profile/data/models/profile_response.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_dog_use_case.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_profile_use_case.dart';

abstract class BaseProfileRemoteDataSource extends BaseAppRemoteDataSource {
  Future<LogoutResponse> logout(NoParameters parameters);
  Future<bool> updateProfile(UpdateProfileParameters parameters);
  Future<ProfileResponse> updateDog(UpdateDogParameters parameters);
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  @override
  Future<LogoutResponse> logout(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.logout,
        method: HttpMethod.post,
        fromJson: (data) => LogoutResponse.fromJson(data));
  }

  @override
  Future<ProfileResponse> updateDog(UpdateDogParameters parameters) async{
    return await makeApiCall(
        url: '${NetworkConstants.myDogs}/${parameters.dogId}',
        method: HttpMethod.patch,
        body: parameters.toJson(),
        fromJson: (data) => ProfileResponse.fromJson(data));
  }

  @override
  Future<bool> updateProfile(UpdateProfileParameters parameters) async{
    return await makeApiCall(
        url: NetworkConstants.profile,
        method: HttpMethod.patch,
        fromJson: (data) => true);
  }
}
