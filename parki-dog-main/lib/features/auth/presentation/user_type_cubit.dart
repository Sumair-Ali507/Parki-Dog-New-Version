import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/routes/routes_manager.dart';
import 'package:parki_dog/features/dog_owner/presentation/buisness_logic/dog_owner_process_%20cubit/dog_owner_process_cubit.dart';

class UserTypeCubit extends Cubit<int?> {
  UserTypeCubit() : super(null); // Initially no selection

  void selectUserType(
      BuildContext context, int id, DogOwnerProcessCubit dogOwnerProcessCubit) {
    emit(id);
    if (id == 1) {
      context.pushNamed(Routes.dogOwnerBasicInfoRoute,
          arguments: dogOwnerProcessCubit);
    }
  }
}
