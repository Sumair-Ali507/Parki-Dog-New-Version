import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/buisness_logic/app_slider_cubit.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/buisness_logic/app_slider_state.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/widgets/indicators.dart';
import 'package:parki_dog/core/shared_widgets/app_slider/widgets/slider_image.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class AppSliderView extends StatelessWidget {
  final List<String> imagesUrls;
  final double width;
  final double height;
  final BoxFit fit;
  final double borderRadius;

  const AppSliderView({
    super.key,
    required this.imagesUrls,
    this.fit = BoxFit.cover,
    required this.width,
    required this.height,
    this.borderRadius = AppDouble.d0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSliderCubit(),
      child: BlocBuilder<AppSliderCubit, AppSliderState>(
        builder: (sliderControlsContext, sliderControlsState) {
          AppSliderCubit sliderControlsCubit =
              sliderControlsContext.read<AppSliderCubit>();
          return Stack(
            children: [
              CarouselSlider(
                controller: sliderControlsCubit.carouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    padEnds: false,
                    height: height,
                    onPageChanged: (index, reason) {
                      sliderControlsCubit.updateIndex(index);
                    }),
                items: imagesUrls
                    .map((item) => SliderImage(
                          item: item,
                          width: width,
                          borderRadius: borderRadius,
                          fit: fit,
                        ))
                    .toList(),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Indicators(
                      sliderControlsCubit: sliderControlsCubit,
                      imagesUrls: imagesUrls),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
