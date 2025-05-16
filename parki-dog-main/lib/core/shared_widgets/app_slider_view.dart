import 'package:parki_dog/core/shared_widgets/image_view_widget.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSliderView extends StatefulWidget {
  final List<String> imagesUrls;
  final double aspectRatio;
  final double width;
  final Color activeColor;
  final Color inActiveColor;
  final BoxFit fit;
  final bool autoPlay;
  const AppSliderView({
    super.key,
    required this.imagesUrls,
    this.aspectRatio = AppDouble.d1_8,
    this.activeColor = Colors.red,
    this.inActiveColor = Colors.grey,
    this.fit = BoxFit.cover,
    this.autoPlay = false,
    required this.width,
  });

  @override
  State<AppSliderView> createState() => _AppSliderViewState();
}

class _AppSliderViewState extends State<AppSliderView> {
  int _current = AppInt.i0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: widget.autoPlay,
              aspectRatio: widget.aspectRatio,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              height: widget.width / widget.aspectRatio,
              viewportFraction: AppDouble.d1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items:
              widget.imagesUrls.map((item) => _buildSliderImage(item)).toList(),
        ),
        Positioned.fill(
          child: _buildIndicators(),
        )
      ],
    );
  }

  Widget _buildSliderImage(String item) {
    return ImageViewWidget(
      imageUrl: item,
      fit: widget.fit,
      width: widget.width,
      cellAspectRatio: widget.aspectRatio,
    );
  }

  _buildIndicators() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.end,
      children: widget.imagesUrls.asMap().entries.map((entry) {
        return _buildIndicatorItem(entry);
      }).toList(),
    );
  }

  Widget _buildIndicatorItem(MapEntry<int, String> entry) {
    return Container(
        width: AppDouble.d10.w,
        height: AppDouble.d10.h,
        margin: EdgeInsets.symmetric(
            vertical: AppDouble.d8.h, horizontal: AppDouble.d4.h),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == entry.key
                ? widget.activeColor
                : widget.inActiveColor));
  }
}
