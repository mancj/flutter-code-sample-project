import 'package:flutter_sample_app/domain/model/recipe.dart';

abstract class IRecipeRestService {
  Future<List<Recipe>> searchRecipes(String query, int limit);

  Future<List<Recipe>> fetchTrendingRecipes();

  Future<List<Recipe>> fetchRecipesByCategory(String category);

  Future<Recipe> fetchRecipeDetails(int recipeId);
}
