import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_landing_screen/src/data/data_sources/local/contract.dart';
import 'package:feature_landing_screen/src/data/data_sources/remote/contract.dart';
import 'package:feature_landing_screen/src/data/fallback/landing_slides_fallback.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';
import 'package:feature_landing_screen/src/domain/repositories/contract.dart';

class LandingScreenRepositoryImpl implements LandingScreenRepository {
  LandingScreenRepositoryImpl({
    required LandingScreenLocalDataSource localDataSource,
    required LandingScreenRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  final LandingScreenLocalDataSource _localDataSource;
  final LandingScreenRemoteDataSource _remoteDataSource;

  static const _cacheDuration = Duration(minutes: 10);

  @override
  ResultFuture<List<LandingSlide>, Failure> fetchSlides() async {
    final cacheTime = _localDataSource.getCacheTime();
    final cachedSlides = _localDataSource.getCachedSlides();

    final isCacheValid =
        cacheTime != null && cachedSlides != null && DateTime.now().difference(cacheTime) < _cacheDuration;

    if (isCacheValid) {
      return Result.success(cachedSlides);
    }

    final result = await _remoteDataSource.fetchSlides();
    switch (result) {
      case Success(:final data):
        _localDataSource.cacheSlides(data);
        return Result.success(data);
      case Error():
        if (cachedSlides != null) {
          return Result.success(cachedSlides);
        }
        return const Result.success(LandingSlidesFallback.slides);
    }
  }
}
