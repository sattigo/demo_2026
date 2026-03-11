import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';

abstract interface class LandingScreenRepository {
  ResultFuture<List<LandingSlide>, Failure> fetchSlides();
}
