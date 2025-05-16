import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/buisness_logic/app_slider_cubit.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/buisness_logic/app_slider_state.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/widgets/indicator_item.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class Indicators extends StatelessWidget {
  final AppSliderCubit sliderControlsCubit;
  final List<String> imagesUrls;

  const Indicators(
      {super.key, required this.sliderControlsCubit, required this.imagesUrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDouble.d4),
      child: BlocBuilder<AppSliderCubit, AppSliderState>(
        bloc: sliderControlsCubit,
        builder: (sliderControlsContext, sliderControlsState) {
          return Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.end,
            children: imagesUrls.asMap().entries.map((entry) {
              return IndicatorItem(
                  carouselController: sliderControlsCubit.carouselController,
                  entry: entry,
                  currentIndex: sliderControlsState.currentIndex);
            }).toList(),
          );
        },
      ),
    );
  }
}
