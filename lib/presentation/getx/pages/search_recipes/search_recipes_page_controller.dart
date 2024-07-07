import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/base_controller.dart';
import 'package:flutter_sample_app/presentation/getx/base/page_args_mixin.dart';
import 'package:flutter_sample_app/presentation/getx/pages/search_recipes/search_recipes_page.dart';
import 'package:get/get.dart';

class SearchRecipesController extends BaseController with PageArgsMixin<SearchRecipesPageArgs> {
  final IRecipeRestService _recipeRestService = Get.find();

  final _recipes = RxList<Recipe>();

  List<Recipe> get recipes => _recipes.value;

  String get searchQuery => args!.query;

  @override
  void onReady() {
    super.onReady();
    _searchRecipes();
    registerDisposable(_recipes);
  }

  Future<void> _searchRecipes() async {
    await withLoading(() async {
      _recipes.value = await _recipeRestService.searchRecipes(searchQuery);
    });
  }
}
