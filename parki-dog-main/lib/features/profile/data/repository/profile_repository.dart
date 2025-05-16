import 'package:dio/dio.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/profile/data/datasource/remote/profile_remote_data_source.dart';
import 'package:parki_dog/features/profile/data/models/logout_response.dart';
import 'package:parki_dog/features/profile/data/models/profile_response.dart';
import 'package:parki_dog/features/profile/domain/repository/base_profile_repository.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_dog_use_case.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_profile_use_case.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

  ProfileRepository(this.baseProfileRemoteDataSource);

  @override
  Future<(Failure?, LogoutResponse?)> logout(NoParameters parameters) async {
    try {
      final result = await baseProfileRemoteDataSource.logout(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, ProfileResponse?)> updateDog(
      UpdateDogParameters parameters) async {
    try {
      final result = await baseProfileRemoteDataSource.updateDog(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, bool?)> updateProfile(
      UpdateProfileParameters parameters) async {
    try {
      final result =
          await baseProfileRemoteDataSource.updateProfile(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
