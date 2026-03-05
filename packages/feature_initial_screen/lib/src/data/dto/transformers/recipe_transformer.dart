import 'package:core_chain/core_chain.dart';
import 'package:feature_initial_screen/src/data/dto/models/recipe_api.build.dart';
import 'package:feature_initial_screen/src/domain/models/recipe.build.dart';

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
      id: id.toString(),
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
