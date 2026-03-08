import 'package:feature_landing_screen/src/data/data_sources/local/contract.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';

class LandingScreenLocalDataSourceImpl implements LandingScreenLocalDataSource {
  List<LandingSlide>? _cachedSlides;
  DateTime? _cacheTime;

  @override
  List<LandingSlide>? getCachedSlides() => _cachedSlides;

  @override
  DateTime? getCacheTime() => _cacheTime;

  @override
  void cacheSlides(List<LandingSlide> slides) {
    _cachedSlides = slides;
    _cacheTime = DateTime.now();
  }
}
