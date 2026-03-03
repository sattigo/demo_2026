import 'package:core_chain/core_chain.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/dto/models/recipe_api.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/dto/validators/recipe_api_validator_exception.dart';

class RecipeApiValidator extends ChainValidator<List<RecipeApi>> {
  @override
  List<RecipeApi> validate(List<RecipeApi>? inParam) {
    if (inParam == null) {
      throw RecipeApiValidatorException();
    }

    for (final recipe in inParam) {
      if (recipe.id == null) {
        throw RecipeApiValidatorException();
      }
    }

    return inParam;
  }
}
