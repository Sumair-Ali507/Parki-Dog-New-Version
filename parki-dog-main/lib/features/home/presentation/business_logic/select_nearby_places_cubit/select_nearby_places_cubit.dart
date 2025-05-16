import 'package:parki_dog/features/home/export/home_export.dart';

enum NearbyPlacesEnum {
  parks(LocaleKeys.home_parks, AppInt.i1),
  clinics(LocaleKeys.home_clinics, AppInt.i2),
  beaches(LocaleKeys.home_beaches, AppInt.i3),
  washingShops(LocaleKeys.home_washingShops, AppInt.i4);

  const NearbyPlacesEnum(this.name, this.id);

  final String name;
  final int id;
}

class SelectNearByPlacesCubit extends Cubit<NearbyPlacesEnum> {
  SelectNearByPlacesCubit() : super(NearbyPlacesEnum.parks);

  void selectPlace(NearbyPlacesEnum place) {
    emit(place);
  }
}
