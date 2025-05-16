import 'package:dio/dio.dart';
import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/dog_owner/data/datasource/remote/dog_owner_remote_data_source.dart';
import 'package:parki_dog/features/dog_owner/data/models/dog_owner_info_response.dart';
import 'package:parki_dog/features/dog_owner/domain/repository/base_dog_owner_repository.dart';
import 'package:parki_dog/features/dog_owner/domain/use_case/submit_info_use_case.dart';

class DogOwnerRepository extends BaseDogOwnerRepository {
  final BaseDogOwnerRemoteDataSource baseDogOwnerRemoteDataSource;

  DogOwnerRepository(this.baseDogOwnerRemoteDataSource);

  @override
  Future<(Failure?, DogOwnerInfoResponse?)> submitInfo(
      InfoParameters parameters) async {
    try {
      final result = await baseDogOwnerRemoteDataSource.submitInfo(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
