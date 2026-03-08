import 'package:core_assets/core_assets.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';
import 'package:feature_landing_screen/src/ui/widgets/slide_image.dart';
import 'package:flutter/material.dart';

class SlidePage extends StatelessWidget {
  const SlidePage({required LandingSlide slide, super.key}) : _slide = slide;

  final LandingSlide _slide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideImage(imageUrl: _slide.imageUrl),
          const SizedBox(height: 32),
          if (_slide.title != null)
            Text(
              _slide.title!,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: FontFamily.oswald),
            ),
          const SizedBox(height: 16),
          if (_slide.subtitle != null)
            Text(
              _slide.subtitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: FontFamily.roboto),
            ),
        ],
      ),
    );
  }
}
