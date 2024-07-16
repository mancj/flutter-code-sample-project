import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/base_controller.dart';
import 'package:flutter_sample_app/presentation/getx/base/page_args_mixin.dart';
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

  void setSelectedTypeIndex(int index) {
    _selectedTab.value = SelectedTabType.values[index];
  }

  @override
  void onReady() {
    super.onReady();
    registerDisposables([_selectedTab, _recipe, _ingredients]);
    _fetchRecipeDetails();
  }

  Future _fetchRecipeDetails() async {
    await execute(() async {
      await Future.delayed(1.seconds, () {}); // fake timeout
      _recipe.value = await _recipeRestService.fetchRecipeDetails(recipe.id);
      _extractIngredients();
    });
  }

  void _extractIngredients() {
    _ingredients.value = _recipe.value?.analyzedInstructions
            ?.expand((element) => element.steps.expand((element) => element.ingredients))
            .toList() ??
        [];
  }
}
