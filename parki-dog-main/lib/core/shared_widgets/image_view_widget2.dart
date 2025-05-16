import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/app_loading_widget.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';

class ImageViewWidget2 extends StatelessWidget {
  final double width;
  final String imageUrl;
  final IconData? errorIcon;
  final Widget? errorView;
  final String? localeErrorImg;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape shape;
  final FilterQuality filterQuality;

  const ImageViewWidget2({
    super.key,
    required this.width,
    required this.imageUrl,
    this.filterQuality = FilterQuality.medium,
    this.errorIcon,
    this.errorView,
    this.localeErrorImg,
    this.fit,
    this.borderRadius,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      imageUrl: imageUrl,
      filterQuality: filterQuality,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
          borderRadius: borderRadius,
          shape: shape,
          boxShadow: boxShadow,
        ),
      ),
      placeholder: (context, url) => const AppLoadingWidget(),
      errorWidget: (context, url, error) => localeErrorImg?.isNotEmpty == true
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(localeErrorImg ?? ImageAssets.placeholder),
                  fit: fit,
                ),
                borderRadius: borderRadius,
                shape: shape,
                boxShadow: boxShadow,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(ImageAssets.placeholder),
                  fit: fit,
                ),
                borderRadius: borderRadius,
                shape: shape,
                boxShadow: boxShadow,
              ),
            ),
    );
  }
}
