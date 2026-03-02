import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_api.build.freezed.dart';

part 'recipe_api.build.g.dart';

@freezed
sealed class RecipeApi with _$RecipeApi {
  factory RecipeApi({
    String? id,
    String? name,
    List<String>? ingredients,
    List<String>? instructions,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int? servings,
    String? difficulty,
  }) = _RecipeApi;

  factory RecipeApi.fromJson(Map<String, dynamic> json) => _$RecipeApiFromJson(json);
}
