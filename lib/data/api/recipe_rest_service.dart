import 'package:dio/dio.dart';
import 'package:flutter_sample_app/data/api/cancelable_api_request.dart';
import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';

class RecipeRestService implements IRecipeRestService {
  final Dio _dio;

  RecipeRestService(this._dio);

  @override
  CancelableRequest<RecipeResults> searchRecipes(String query, int limit, int offset) {
    return CancelableApiRequest((token) async {
      var response = await _dio.get(
        cancelToken: token,
        'recipes/complexSearch',
        queryParameters: {
          'query': query,
          'addRecipeInformation': true,
          'number': limit,
          'offset': offset,
        },
      );
      return RecipeResults.fromJson(response.data);
    });
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
