import 'package:core_assets/src/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';

extension AssetGenImageX on AssetGenImage {
  Image pkg({
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    Color? color,
    BlendMode? colorBlendMode,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return image(
      package: 'core_assets',
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
      colorBlendMode: colorBlendMode,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  AssetImage pkgProvider() => provider(package: 'core_assets') as AssetImage;
}
