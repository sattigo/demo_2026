import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';

abstract interface class LandingScreenLocalDataSource {
  List<LandingSlide>? getCachedSlides();

  DateTime? getCacheTime();

  void cacheSlides(List<LandingSlide> slides);
}
