import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/base_controller.dart';
import 'package:flutter_sample_app/presentation/getx/base/page_args_mixin.dart';
import 'package:flutter_sample_app/presentation/getx/pages/ingredient_details/ingredient_details_page.dart';
import 'package:flutter_sample_app/presentation/getx/pages/recipe_details/recipe_details_page.dart';
import 'package:get/get.dart';

class RecipeDetailsController extends BaseController with PageArgsMixin<RecipeDetailsPageArgs> {
  final IRecipeRestService _recipeRestService = Get.find();

  String get pageTitle => args!.recipe.title;

  Recipe get recipe => args!.recipe;

  final _selectedTab = Rx(SelectedTabType.info);

  SelectedTabType get selectedTab => _selectedTab.value;

  final _recipe = Rxn<Recipe>();

  final _ingredients = RxList<Ingredient>();

  List<Ingredient> get ingredients => _ingredients.value;

  final _similarRecipes = RxList<Recipe>();

  List<Recipe> get similarRecipes => _similarRecipes.value;

  void setSelectedTypeIndex(int index) {
    _selectedTab.value = SelectedTabType.values[index];
  }

  @override
  void onReady() {
    super.onReady();
    registerDisposables([_selectedTab, _recipe, _ingredients]);
    _fetchRecipeDetails();
    _fetchSimilarRecipes();
  }

  Future _fetchRecipeDetails() async {
    await execute(() async {
      await Future.delayed(1.seconds, () {}); // fake timeout
      _recipe.value = await _recipeRestService.fetchRecipeDetails(recipe.id);
      _extractIngredients();
    });
  }

  Future _fetchSimilarRecipes() async {
    await execute(() async {
      await Future.delayed(1.seconds, () {}); // fake timeout
      _similarRecipes.value = await _recipeRestService.fetchSimilarRecipes(recipe.id);
    });
  }

  void _extractIngredients() {
    _ingredients.value = _recipe.value?.analyzedInstructions
            ?.expand((element) => element.steps.expand((element) => element.ingredients))
            .toList() ??
        [];
  }

  void showIngredientDetails(Ingredient ingredient) {
    Get.toNamed(
      IngredientDetailsPage.routeName,
      arguments: IngredientPageArgs(ingredient: ingredient),
    );
  }
}
