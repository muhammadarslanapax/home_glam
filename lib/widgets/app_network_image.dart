// import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:home_glam/utils/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
    this.url, {
    super.key,
    this.loadingWidget,
    this.errorWidget,
    this.fit,
    this.cacheHeight,
    this.cacheWidth,
    this.width,
    this.height,
    this.compressionRatio,
    this.loadStateChanged,
  });

  final String url;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final BoxFit? fit;
  final int? cacheWidth;
  final int? cacheHeight;
  final double? width;
  final double? height;
  final double? compressionRatio;
  final Function(ExtendedImageState)? loadStateChanged;
  // static Future<File?> getCachedImage(String url, {String? cacheKey}) {
  //   return getCachedImageFile(url, cacheKey: cacheKey);
  // }

  static Future<void> clearCached() {
    return clearDiskCachedImages();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      fit: fit,
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      printError: false,
      compressionRatio: compressionRatio,
      loadStateChanged: (state) {
        loadStateChanged?.call(state);
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Center(
              child: loadingWidget ?? const SizedBox(),
            );
          case LoadState.completed:
            return null;
          case LoadState.failed:
            return errorWidget ??
                Container(
                  height: 40,
                  color: AppColors.black.withOpacity(.2),
                  child: const Center(
                    child: Icon(Icons.error),
                  ),
                );
        }
      },
    );
  }
}
