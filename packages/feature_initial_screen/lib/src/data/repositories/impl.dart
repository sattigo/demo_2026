import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_initial_screen/src/data/data_sources/local/contract.dart';
import 'package:feature_initial_screen/src/data/data_sources/remote/contract.dart';
import 'package:feature_initial_screen/src/domain/models/recipe.build.dart';
import 'package:feature_initial_screen/src/domain/repositories/repository_contract.dart';

class InitialScreenRepositoryImpl implements InitialScreenRepository {
  InitialScreenRepositoryImpl({
    required InitialScreenLocalDataSource localDataSource,
    required InitialScreenRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  final InitialScreenLocalDataSource _localDataSource;
  final InitialScreenRemoteDataSource _remoteDataSource;

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
