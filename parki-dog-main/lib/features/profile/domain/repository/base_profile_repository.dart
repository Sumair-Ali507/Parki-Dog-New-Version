import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/core/routes/routes_export.dart';
import 'package:parki_dog/features/profile/data/models/logout_response.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_dog_use_case.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_profile_use_case.dart';

abstract class BaseProfileRepository {
  Future<(Failure?, LogoutResponse?)> logout(NoParameters parameters);
  Future<(Failure?, bool?)> updateProfile(UpdateProfileParameters parameters);
  Future<(Failure?, ProfileResponse?)> updateDog(UpdateDogParameters parameters);
}
