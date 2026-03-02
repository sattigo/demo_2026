import 'dart:collection';

import 'package:demo_2026/feature/chain/chain_transformer.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/dto/models/recipe_api.build.dart';

class RecipeApiTransformer extends ChainTransformer<LinkedHashMap<String, dynamic>, List<RecipeApi>> {
  @override
  List<RecipeApi>? transform(LinkedHashMap<String, dynamic> inParam) {
    final resultList = <RecipeApi>[];
    final list = inParam['recipes'] as List<Map<String, dynamic>>;
    for (final item in list) {
      resultList.add(RecipeApi.fromJson(item));
    }
    return resultList;
  }
}
