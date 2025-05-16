import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/dog_owner/data/models/dog_owner_info_response.dart';
import 'package:parki_dog/features/dog_owner/domain/use_case/submit_info_use_case.dart';

abstract class BaseDogOwnerRemoteDataSource extends BaseAppRemoteDataSource {
  Future<DogOwnerInfoResponse> submitInfo(InfoParameters parameters);
}

class DogOwnerRemoteDataSource extends BaseDogOwnerRemoteDataSource {
  @override
  Future<DogOwnerInfoResponse> submitInfo(InfoParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.submitInfo}}',
        method: HttpMethod.post,
        fromJson: (data) => DogOwnerInfoResponse.fromJson(data));
  }
}
