import 'package:feature_initial_screen/src/domain/models/recipe.build.dart';

abstract interface class InitialScreenLocalDataSource {
  List<Recipe>? getCachedRecipes();
  DateTime? getCacheTime();
  void cacheRecipes(List<Recipe> recipes);
}
