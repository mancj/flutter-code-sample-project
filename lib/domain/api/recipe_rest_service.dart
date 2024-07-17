import 'package:flutter_sample_app/domain/model/_model.dart';

abstract class IRecipeRestService {
  CancelableRequest<RecipeResults> searchRecipes(String query, int limit, int offset);

  Future<List<Recipe>> fetchTrendingRecipes();

  Future<List<Recipe>> fetchRecipesByCategory(String category);

  Future<Recipe> fetchRecipeDetails(int recipeId);

  Future<List<Recipe>> fetchSimilarRecipes(int recipeId);

  Future<IngredientDetails> fetchIngredientDetails(int ingredientId);

}
