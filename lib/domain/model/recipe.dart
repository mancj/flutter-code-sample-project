import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.g.dart';

part 'recipe.freezed.dart';

@freezed
class RecipeResults with _$RecipeResults {
  const factory RecipeResults({
    required List<Recipe> results,
  }) = _RecipeResults;

  factory RecipeResults.fromJson(dynamic json) => _$RecipeResultsFromJson(json);
}

@freezed
class RecipesHolderResults with _$RecipesHolderResults {
  const factory RecipesHolderResults({
    required List<Recipe> recipes,
  }) = _RecipesHolderResults;

  factory RecipesHolderResults.fromJson(dynamic json) => _$RecipesHolderResultsFromJson(json);
}

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String title,
    required String image,
    required int readyInMinutes,
  }) = _Recipe;

  factory Recipe.fromJson(dynamic json) => _$RecipeFromJson(json);
}
