import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/base_controller.dart';
import 'package:flutter_sample_app/presentation/getx/base/page_args_mixin.dart';
import 'package:flutter_sample_app/presentation/getx/pages/recipe_details/recipe_details_page.dart';
import 'package:flutter_sample_app/presentation/getx/pages/search_recipes/search_recipes_page.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchRecipesController extends BaseController with PageArgsMixin<SearchRecipesPageArgs> {
  final IRecipeRestService _recipeRestService = Get.find();

  final _recipes = RxList<Recipe>();

  List<Recipe> get recipes => _recipes.value;

  String get searchQuery => args!.query;

  final pagingController = PagingController<int, Recipe>(firstPageKey: 0);

  @override
  void onReady() {
    super.onReady();
    _searchRecipes(0);
    registerDisposable(_recipes);
    pagingController.addPageRequestListener((pageKey) {
      _searchRecipes(pageKey);
    });
  }

  Future<void> _searchRecipes(int pageKey) async {
    await withLoading(() async {
      try {
        final newItems = await _recipeRestService.searchRecipes(searchQuery, 10, pageKey);
        final isLastPage = newItems.length < 10;
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          pagingController.appendPage(newItems, nextPageKey);
        }
      } catch (error) {
        pagingController.error = error;
      }
    });
  }

  void showRecipeDetails(Recipe recipe) {
    Get.toNamed(
      RecipeDetailsPage.routeName,
      arguments: RecipeDetailsPageArgs(recipe: recipe),
    );
  }
}
