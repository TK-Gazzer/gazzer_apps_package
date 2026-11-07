import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/widgets/insta_image_viewer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.blendMode,
    this.borderRaduis,
    this.isInsta = false,
    this.errorWidget,
    this.alignment = Alignment.center,
    this.opacity,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BlendMode? blendMode;
  final double? borderRaduis;
  final bool isInsta;
  final AlignmentGeometry alignment;
  final Widget? errorWidget;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    Widget child;
    final errorShown = Container(
      width: width ?? 42,
      height: height ?? 42,

      decoration: BoxDecoration(color: context.isDarkMode ? Colors.grey[700]! : Colors.grey[200]!),
      child: errorWidget ?? const Icon(Icons.broken_image, color: Colors.grey, size: 42),
    );
    if (imageUrl.endsWith('svg')) {
      child = SvgPicture.network(
        imageUrl.split('?').first,
        placeholderBuilder: (context) => Skeletonizer(
          effect: ShimmerEffect(
            baseColor: context.isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
            highlightColor: context.isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
          ),
          child: Container(
            height: height,
            width: width,
            color: Colors.grey,
            // child: const Center(child: LoadingWidget()),
          ),
        ),
        height: height,
        width: width,
        alignment: alignment,
        fit: fit ?? BoxFit.cover,
        // ignore: avoid_print
        errorBuilder: (context, url, error) {
          return errorShown;
        },
      );
    } else {
      child = CachedNetworkImage(
        imageUrl: imageUrl.split('?').first,
        placeholder: (context, url) => Skeletonizer(
          effect: ShimmerEffect(
            baseColor: context.isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
            highlightColor: context.isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
          ),
          child: Container(
            height: height,
            width: width,
            color: Colors.grey,
            // child: const Center(child: LoadingWidget()),
          ),
        ),
        imageBuilder: (context, imageProvider) => Image(
          image: imageProvider,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment,
          colorBlendMode: blendMode,
          opacity: AlwaysStoppedAnimation(opacity ?? 1.0),
        ),
        // ignore: avoid_print
        errorListener: (value) => debugPrint(value.toString()),
        errorWidget: (context, url, error) {
          return errorShown;
        },
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRaduis ?? 0),
      child: isInsta ? InstaImageViewer(imageUrl: imageUrl.split('?').first, child: child) : child,
    );
  }
}
