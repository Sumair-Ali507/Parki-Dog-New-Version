import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/buisness_logic/app_slider_state.dart';

class AppSliderCubit extends Cubit<AppSliderState> {
  final CarouselSliderController carouselController =
      CarouselSliderController();

  AppSliderCubit()
      : super(AppSliderState(
          currentIndex: 0,
        ));

  void updateIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
