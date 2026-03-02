import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';

abstract interface class InitialScreenLocalDataSource {
  List<Recipe>? getCachedRecipes();
  DateTime? getCacheTime();
  void cacheRecipes(List<Recipe> recipes);
}
