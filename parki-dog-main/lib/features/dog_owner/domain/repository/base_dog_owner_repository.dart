import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/dog_owner/data/models/dog_owner_info_response.dart';
import 'package:parki_dog/features/dog_owner/domain/use_case/submit_info_use_case.dart';

abstract class BaseDogOwnerRepository {
  Future<(Failure?, DogOwnerInfoResponse?)> submitInfo(
      InfoParameters parameters);
}
