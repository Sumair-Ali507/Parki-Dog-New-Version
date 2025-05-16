import 'package:parki_dog/core/shared_widgets/image_view_widget.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedImagesGridView extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final double cellAspectRatio;
  final List<String> imagesUrls;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape shape;
  final EdgeInsets? padding;
  final double verticalSpace;
  final double horizontalSpace;
  final int itemCount;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool? primary;

  const SizedImagesGridView(
      {super.key,
      required this.imageWidth,
      required this.imageHeight,
      this.cellAspectRatio = 1,
      required this.imagesUrls,
      this.fit,
      this.borderRadius,
      this.boxShadow,
      this.shape = BoxShape.rectangle,
      this.padding,
      this.verticalSpace = 8,
      this.horizontalSpace = 8,
      required this.itemCount,
      this.shrinkWrap = false,
      this.physics,
      this.primary});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: imageWidth.w,
          mainAxisSpacing: verticalSpace.h,
          crossAxisSpacing: horizontalSpace.w,
          childAspectRatio: cellAspectRatio,
          mainAxisExtent: imageHeight.h),
      itemBuilder: (context, index) => ImageViewWidget(
        width: imageWidth.w,
        cellAspectRatio: cellAspectRatio,
        borderRadius: borderRadius,
        fit: fit,
        boxShadow: boxShadow,
        imageUrl: imagesUrls[index],
        shape: shape,
      ),
      itemCount: itemCount,
      shrinkWrap: shrinkWrap,
      physics: physics,
      primary: primary,
    );
  }
}

class FlexImagesGridView extends StatelessWidget {
  final int imagesNumberInRow;
  // final double imageHeight;
  final double cellAspectRatio;
  final List<String> imagesUrls;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape shape;
  final EdgeInsets? padding;
  final double verticalSpace;
  final double horizontalSpace;
  final int itemCount;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool? primary;

  const FlexImagesGridView(
      {super.key,
      required this.imagesNumberInRow,
      // required this.imageHeight,
      this.cellAspectRatio = AppDouble.d1,
      required this.imagesUrls,
      this.fit,
      this.borderRadius,
      this.boxShadow,
      this.shape = BoxShape.rectangle,
      this.padding,
      this.verticalSpace = AppDouble.d8,
      this.horizontalSpace = AppDouble.d8,
      required this.itemCount,
      this.shrinkWrap = false,
      this.physics,
      this.primary});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: imagesNumberInRow,
        mainAxisSpacing: verticalSpace.h,
        crossAxisSpacing: horizontalSpace.w,
        childAspectRatio: cellAspectRatio,
      ),
      itemBuilder: (context, index) => ImageViewWidget(
        width: AppDouble.d0,
        cellAspectRatio: cellAspectRatio,
        borderRadius: borderRadius,
        fit: fit,
        boxShadow: boxShadow,
        imageUrl: imagesUrls[index],
        shape: shape,
      ),
      itemCount: itemCount,
      shrinkWrap: shrinkWrap,
      physics: physics,
      primary: primary,
    );
  }
}
