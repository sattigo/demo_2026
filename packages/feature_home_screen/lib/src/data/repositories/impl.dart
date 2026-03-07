import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_home_screen/src/data/data_sources/local/contract.dart';
import 'package:feature_home_screen/src/data/data_sources/remote/contract.dart';
import 'package:feature_home_screen/src/domain/models/recipe.build.dart';
import 'package:feature_home_screen/src/domain/repositories/repository_contract.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  HomeScreenRepositoryImpl({
    required HomeScreenLocalDataSource localDataSource,
    required HomeScreenRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  final HomeScreenLocalDataSource _localDataSource;
  final HomeScreenRemoteDataSource _remoteDataSource;

  static const _cacheDuration = Duration(minutes: 5);

  @override
  ResultFuture<List<Recipe>, Failure> fetchData() async {
    final cacheTime = _localDataSource.getCacheTime();
    final cachedRecipes = _localDataSource.getCachedRecipes();

    final isCacheValid =
        cacheTime != null && cachedRecipes != null && DateTime.now().difference(cacheTime) < _cacheDuration;

    if (isCacheValid) {
      return Result.success(cachedRecipes);
    }

    final result = await _remoteDataSource.fetchData();
    if (result case Success(:final data)) {
      _localDataSource.cacheRecipes(data);
    }
    return result;
  }
}
