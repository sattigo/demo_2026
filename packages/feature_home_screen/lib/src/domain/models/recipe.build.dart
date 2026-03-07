import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.build.freezed.dart';

@freezed
sealed class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    String? name,
    List<String>? ingredients,
    List<String>? instructions,
    DateTime? preparationTime,
    DateTime? cookTime,
  }) = _Recipe;
}
