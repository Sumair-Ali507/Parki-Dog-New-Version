import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
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

abstract class BaseHomeRepository {
  Future<(Failure?, ProfileResponse?)> profile(NoParameters parameters);

  Future<(Failure?, AllParksResponse?)> getAllParks(NoParameters parameters);

  Future<(Failure?, Park?)> getPark(GetParkParameters parameters);

  Future<(Failure?, CheckIn?)> checkIn(CheckInParameters parameters);

  Future<(Failure?, bool?)> checkOut(NoParameters parameters);

  Future<(Failure?, NearByParksResponse?)> nearByParks(
      NearByParksParameters parameters);

  Future<(Failure?, ParkCheckInsResponse?)> parkCheckInsResponse(
      ParkCheckInsParameters parameters);
}
