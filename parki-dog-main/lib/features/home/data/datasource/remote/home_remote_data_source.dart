import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/dog_owner/data/models/near_by_parks.dart';
import 'package:parki_dog/features/home/data/models/all_parks_response.dart';
import 'package:parki_dog/features/home/data/models/checkin.dart';
import 'package:parki_dog/features/home/data/models/park.dart';
import 'package:parki_dog/features/home/data/models/park_chek_in_response.dart';
import 'package:parki_dog/features/home/domain/use_case/check_in_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/get_park_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/near_by_parks_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/park_checkins_use_case.dart';
import 'package:parki_dog/features/profile/data/models/profile_response.dart';

abstract class BaseHomeRemoteDataSource extends BaseAppRemoteDataSource {
  Future<ProfileResponse> profile(NoParameters parameters);

  Future<AllParksResponse> getAllParks(NoParameters parameters);

  Future<Park> getPark(GetParkParameters parameters);

  Future<CheckIn> checkIn(CheckInParameters parameters);

  Future<bool> checkout(NoParameters parameters);

  Future<NearByParksResponse> nearByParks(NearByParksParameters parameters);

  Future<ParkCheckInsResponse> parkCheckInsResponse(
      ParkCheckInsParameters parameters);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<CheckIn> checkIn(CheckInParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.checkIn,
        method: HttpMethod.post,
        body: {"parkId": parameters.parkId, "dogId": parameters.dogId},
        fromJson: (data) => CheckIn.fromJson(data['data']));
  }

  @override
  Future<bool> checkout(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.checkOut,
        method: HttpMethod.post,
        fromJson: (data) => data);
  }

  @override
  Future<AllParksResponse> getAllParks(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.parks,
        method: HttpMethod.get,
        fromJson: (data) => AllParksResponse.fromJson(data));
  }

  @override
  Future<Park> getPark(GetParkParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.parks}/${parameters.id}',
        method: HttpMethod.get,
        fromJson: (data) => Park.fromJson(data['data']));
  }

  @override
  Future<NearByParksResponse> nearByParks(
      NearByParksParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.nearbyParks,
        method: HttpMethod.get,
        queryParams: {
          "lat": parameters.lat,
          "long": parameters.long,
          "radius": parameters.radius,
          "type": parameters.type
        },
        fromJson: (data) => NearByParksResponse.fromJson(data));
  }

  @override
  Future<ParkCheckInsResponse> parkCheckInsResponse(
      ParkCheckInsParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.parks}/${parameters.parkId}/checkins',
        method: HttpMethod.get,
        fromJson: (data) => ParkCheckInsResponse.fromJson(data));
  }

  @override
  Future<ProfileResponse> profile(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.profile,
        method: HttpMethod.get,
        fromJson: (data) => ProfileResponse.fromJson(data));
  }
}
