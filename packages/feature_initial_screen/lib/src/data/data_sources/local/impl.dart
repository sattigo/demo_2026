import 'package:feature_initial_screen/src/data/data_sources/local/contract.dart';
import 'package:feature_initial_screen/src/domain/models/recipe.build.dart';

class InitialScreenLocalDataSourceImpl implements InitialScreenLocalDataSource {
  List<Recipe>? _cachedRecipes;
  DateTime? _cacheTime;

  @override
  List<Recipe>? getCachedRecipes() => _cachedRecipes;

  @override
  DateTime? getCacheTime() => _cacheTime;

  @override
  void cacheRecipes(List<Recipe> recipes) {
    _cachedRecipes = recipes;
    _cacheTime = DateTime.now();
  }
}
