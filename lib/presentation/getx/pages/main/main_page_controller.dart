import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/base_controller.dart';
import 'package:flutter_sample_app/presentation/getx/pages/recipe_details/recipe_details_page.dart';
import 'package:flutter_sample_app/presentation/getx/pages/search_recipes/search_recipes_page.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  final IRecipeRestService _recipeRestService = Get.find();

  final List<String> popularCategories = [
    'Appetizers',
    'Main Courses',
    'Desserts',
    'Salads',
    'Soups',
    'Breakfast',
    'Beverages',
    'Snacks',
    'Baked Goods',
  ];

  final RxList<Recipe> _trendingRecipes = RxList();

  List<Recipe> get trendingRecipes => _trendingRecipes.value;

  final _isTrendingRecipesLoading = false.obs;

  bool get isTrendingRecipesLoading => _isTrendingRecipesLoading.value;

  final _selectedPopularCategoryId = RxInt(0);

  int get selectedPopularCategoryId => _selectedPopularCategoryId.value;

  final searchFieldController = TextEditingController();

  void setSelectedPopularCategoryId(int value) {
    _selectedPopularCategoryId.value = value;
    _getPopularRecipesCategory();
  }

  final RxList<Recipe> _popularRecipesCategory = RxList();

  List<Recipe> get popularRecipesCategory => _popularRecipesCategory.value;

  final _isPopularRecipesCategoryLoading = false.obs;

  bool get isPopularRecipesCategoryLoading => _isPopularRecipesCategoryLoading.value;

  @override
  void onReady() {
    super.onReady();
    _getTrendingRecipes();
    _getPopularRecipesCategory();
    registerDisposables([
      _trendingRecipes,
      _selectedPopularCategoryId,
      _popularRecipesCategory,
      _isTrendingRecipesLoading,
      _isPopularRecipesCategoryLoading,
    ]);
  }

  void searchRecipes(String query) async {
    searchFieldController.clear();
    Get.toNamed(
      SearchRecipesPage.routeName,
      arguments: SearchRecipesPageArgs(query: query.trim()),
    );
  }

  Future<void> _getTrendingRecipes() async {
    await execute(
      () async {
        _trendingRecipes.value = await _recipeRestService.fetchTrendingRecipes();
      },
      loadingFlag: _isTrendingRecipesLoading,
    );
  }

  Future<void> _getPopularRecipesCategory() async {
    await execute(
      () async {
        var category = popularCategories[_selectedPopularCategoryId.value];
        _popularRecipesCategory.value = await _recipeRestService.fetchRecipesByCategory(category);
        _popularRecipesCategory.refresh();
      },
      loadingFlag: _isPopularRecipesCategoryLoading,
    );
  }

  void showRecipeDetails(Recipe recipe) {
    Get.toNamed(
      RecipeDetailsPage.routeName,
      arguments: RecipeDetailsPageArgs(recipe: recipe),
    );
  }

  Future<void> refreshPage() async {
    _isTrendingRecipesLoading.value = true;
    _isPopularRecipesCategoryLoading.value = true;
    await _getTrendingRecipes();
    await _getPopularRecipesCategory();
  }
}
