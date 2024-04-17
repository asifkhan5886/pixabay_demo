import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixabay_demo/common_widges/app_image_widget.dart';

import 'pinch_zoom_widget.dart';

class ImageViewer extends StatelessWidget {
  final String image;
  final String heroTag;

  const ImageViewer({
    super.key,
    required this.image,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          PinchZoom(
            resetDuration: const Duration(milliseconds: 100),
            maxScale: 2.5,
            child: Hero(
                tag: heroTag,
                flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  //final Widget toHero = toHeroContext.widget;
                  final customAnimation =
                      Tween<double>(begin: 0, end: 2).animate(animation);

                  return AnimatedBuilder(
                      animation: customAnimation,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.003)
                            ..rotateX(customAnimation.value * pi),
                          alignment: Alignment.center,
                          child: defaultImageWidget(context),
                        );
                      });
                },
                child: defaultImageWidget(context)),
          ),
          Positioned(
              top: 35,
              right: 15,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.black,
                  ))),
        ],
      ),
    );
  }

  Widget defaultImageWidget(BuildContext context) {
    return AppImageWidget(
      imageUrl: image,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.contain,
    );
  }
}
