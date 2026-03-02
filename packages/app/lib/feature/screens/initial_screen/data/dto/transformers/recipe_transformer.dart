import 'package:demo_2026/feature/chain/chain_transformer.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/dto/models/recipe_api.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';

class RecipeTransformer extends ChainTransformer<List<RecipeApi>, List<Recipe>> {
  @override
  List<Recipe>? transform(List<RecipeApi> inParam) {
    return inParam.map(_toRecipe).nonNulls.toList();
  }

  Recipe? _toRecipe(RecipeApi inParam) {
    final id = inParam.id;
    if (id == null) {
      return null;
    }

    return Recipe(
      id: id,
      name: inParam.name,
      ingredients: inParam.ingredients,
      instructions: inParam.instructions,
      preparationTime: inParam.prepTimeMinutes != null
          ? DateTime.fromMillisecondsSinceEpoch(Duration(minutes: inParam.prepTimeMinutes!).inMilliseconds)
          : null,
      cookTime: inParam.cookTimeMinutes != null
          ? DateTime.fromMillisecondsSinceEpoch(Duration(minutes: inParam.cookTimeMinutes!).inMilliseconds)
          : null,
    );
  }
}
