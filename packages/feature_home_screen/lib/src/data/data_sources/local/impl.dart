import 'package:feature_home_screen/src/data/data_sources/local/contract.dart';
import 'package:feature_home_screen/src/domain/models/recipe.build.dart';

class HomeScreenLocalDataSourceImpl implements HomeScreenLocalDataSource {
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
