import 'package:dio/dio.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/dog_owner/data/models/near_by_parks.dart';
import 'package:parki_dog/features/home/data/datasource/remote/home_remote_data_source.dart';
import 'package:parki_dog/features/home/data/models/all_parks_response.dart';
import 'package:parki_dog/features/home/data/models/checkin.dart';
import 'package:parki_dog/features/home/data/models/park.dart';
import 'package:parki_dog/features/home/data/models/park_chek_in_response.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';
import 'package:parki_dog/features/home/domain/use_case/check_in_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/get_park_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/near_by_parks_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/park_checkins_use_case.dart';
import 'package:parki_dog/features/profile/data/models/profile_response.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<(Failure?, CheckIn?)> checkIn(CheckInParameters parameters) async {
    try {
      final result = await baseHomeRemoteDataSource.checkIn(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, bool?)> checkOut(NoParameters parameters) async {
    try {
      final result = await baseHomeRemoteDataSource.checkout(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, AllParksResponse?)> getAllParks(
      NoParameters parameters) async {
    try {
      final result = await baseHomeRemoteDataSource.getAllParks(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, Park?)> getPark(GetParkParameters parameters) async {
    try {
      final result = await baseHomeRemoteDataSource.getPark(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, NearByParksResponse?)> nearByParks(
      NearByParksParameters parameters) async {
    try {
      final result = await baseHomeRemoteDataSource.nearByParks(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, ParkCheckInsResponse?)> parkCheckInsResponse(
      ParkCheckInsParameters parameters) async {
    try {
      final result =
          await baseHomeRemoteDataSource.parkCheckInsResponse(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, ProfileResponse?)> profile(NoParameters parameters) async {
    try {
      final result = await baseHomeRemoteDataSource.profile(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
