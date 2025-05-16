import 'package:parki_dog/core/shared_widgets/app_loading_widget.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewWidget extends StatefulWidget {
  final double width;
  final double? height;
  final double cellAspectRatio;
  final String imageUrl;
  final IconData? errorIcon;
  final Widget? errorView;
  final String? localeErrorImg;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape shape;

  const ImageViewWidget({
    super.key,
    required this.width,
    this.height,
    required this.cellAspectRatio,
    required this.imageUrl,
    this.errorIcon,
    this.errorView,
    this.localeErrorImg,
    this.fit,
    this.borderRadius,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
  });

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> {
  @override
  Widget build(BuildContext context) {
    double cellHeight = widget.width / widget.cellAspectRatio;
    return SizedBox(
      height: cellHeight,
      child: AspectRatio(
        aspectRatio: widget.cellAspectRatio,
        child: CachedNetworkImage(
          width: widget.width,
          height: widget.height,
          imageUrl: widget.imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: widget.fit,
              ),
              borderRadius: widget.borderRadius,
              shape: widget.shape,
              boxShadow: widget.boxShadow,
            ),
          ),
          placeholder: (context, url) => const AppLoadingWidget(),
          errorWidget: (context, url, error) =>
              widget.localeErrorImg?.isNotEmpty == true
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              widget.localeErrorImg ?? ImageAssets.placeholder),
                          fit: widget.fit,
                        ),
                        borderRadius: widget.borderRadius,
                        shape: widget.shape,
                        boxShadow: widget.boxShadow,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(ImageAssets.placeholder),
                          fit: widget.fit,
                        ),
                        borderRadius: widget.borderRadius,
                        shape: widget.shape,
                        boxShadow: widget.boxShadow,
                      ),
                    ),
        ),
      ),
    );
  }
}
