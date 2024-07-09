import 'package:dio/dio.dart';
import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/recipe.dart';

import 'constants.dart';

class RecipeRestService implements IRecipeRestService {
  final Dio _dio;

  RecipeRestService(this._dio);

  @override
  Future<List<Recipe>> searchRecipes(String query, int limit) async {
    var response = await _dio.get(
      'recipes/complexSearch',
      queryParameters: {
        'query': query,
        'addRecipeInformation': true,
        'number': limit,
      },
    );
    var recipes = RecipeResults.fromJson(response.data);
    return recipes.results;
  }

  @override
  Future<List<Recipe>> fetchTrendingRecipes() async {
    final response = await _dio.get(
      'recipes/random',
      queryParameters: {'number': 5},
    );
    var recipes = RecipesHolderResults.fromJson(response.data);
    return recipes.recipes;
  }

  @override
  Future<List<Recipe>> fetchRecipesByCategory(String category) async {
    final Map<String, dynamic> queryParams = {
      'query': category,
      'addRecipeInformation': true,
      'number': 10,
    };
    final Response response = await _dio.get(
      'recipes/complexSearch',
      queryParameters: queryParams,
    );
    return RecipeResults.fromJson(response.data).results;
  }

  @override
  Future<Recipe> fetchRecipeDetails(int recipeId) async {
    final Response response = await _dio.get(
      'recipes/$recipeId/information',
    );
    return Recipe.fromJson(response.data);
  }
}
