import 'package:parki_dog/features/profile/export/profile_export.dart';

enum OwnerDogEnum {
  owner(LocaleKeys.profile_owner, AppInt.i1),
  dog(LocaleKeys.profile_dog, AppInt.i2);

  const OwnerDogEnum(this.title, this.id);

  final String title;
  final int id;
}

class OwnerDogCubit extends Cubit<OwnerDogEnum> {
  OwnerDogCubit() : super(OwnerDogEnum.owner); // Initial state

  void selectOwner() {
    emit(OwnerDogEnum.owner);
  }

  void selectDog() {
    emit(OwnerDogEnum.dog);
  }
}
