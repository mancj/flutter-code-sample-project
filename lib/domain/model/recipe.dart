import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.g.dart';

part 'recipe.freezed.dart';

@freezed
class RecipeResults with _$RecipeResults {
  const factory RecipeResults({
    required List<Recipe> results,
    required int totalResults,
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
    String? summary,
    double? spoonacularScore,
    int? aggregateLikes,
    List<String>? cuisines,
    List<String>? dishTypes,
    List<String>? diets,
    List<AnalyzedInstruction>? analyzedInstructions,
  }) = _Recipe;

  factory Recipe.fromJson(dynamic json) => _$RecipeFromJson(json);
}
