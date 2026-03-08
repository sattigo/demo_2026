import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';
import 'package:feature_landing_screen/src/domain/repositories/repository_contract.dart';

class FetchSlidesUseCase {
  FetchSlidesUseCase({required LandingScreenRepository repository}) : _repository = repository;

  final LandingScreenRepository _repository;

  ResultFuture<List<LandingSlide>, Failure> call() => _repository.fetchSlides();
}
