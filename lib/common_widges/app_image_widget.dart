
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_demo/assets/app_assets.dart';
import 'package:pixabay_demo/common_widges/common_circular_progress_indicator.dart';

/// common app image widget which automatic identify & display image as network or asset or svg
// ignore: must_be_immutable
class AppImageWidget extends StatelessWidget {
  final String imageUrl;
  final String? placeholderImg;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? borderRadius;
  bool isRounded = false;

  AppImageWidget({
    super.key,
    required this.imageUrl,
    this.placeholderImg,
    this.borderRadius,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.isRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isRounded ? borderRadius ?? 100 : 0),
      child: getImageWidgetAccordingToType(),
    );
  }

  Widget getImageWidgetAccordingToType() {
    if (imageUrl.contains("assets") &&
        !(imageUrl.contains("http") || imageUrl.contains("www"))) {
        return Image.asset(
          imageUrl,
          fit: fit,
          height: isRounded ? width : height,
          width: width,
        );
    } else {
   if (imageUrl.contains("http") || imageUrl.contains("www")) {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CommonCircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            placeholderImg ?? AppAssets.placeholder,
            fit: fit,
          ),
          height: isRounded ? width : height,
          width: width,
          fit: fit,
        );
      } else {
        // return Image.file(
        //   File(imageUrl),
        //   height: isRounded ? width : height,
        //   width: width,
        //   fit: fit,
        //   errorBuilder: (context, url, error) => Image.asset(
        //    placeholderImg?? AppAssets.placeholder,
        //     fit: fit,
        //   ),
        // );
        return Image.asset(
          placeholderImg ?? AppAssets.placeholder,
          fit: fit,
          width: width,
          height: isRounded ? width : height,
        );
      }
    }
  }
}
