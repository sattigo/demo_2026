import 'package:feature_home_screen/src/domain/models/recipe.build.dart';

abstract interface class HomeScreenLocalDataSource {
  List<Recipe>? getCachedRecipes();
  DateTime? getCacheTime();
  void cacheRecipes(List<Recipe> recipes);
}
