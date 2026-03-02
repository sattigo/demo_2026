import 'package:demo_2026/feature/screens/initial_screen/data/data_sources/local/contract.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';

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
