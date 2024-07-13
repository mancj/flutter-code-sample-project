import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/base_controller.dart';
import 'package:flutter_sample_app/presentation/getx/base/page_args_mixin.dart';
import 'package:flutter_sample_app/presentation/getx/pages/recipe_details/recipe_details_page.dart';
import 'package:flutter_sample_app/presentation/getx/pages/search_recipes/search_recipes_page.dart';
import 'package:flutter_sample_app/presentation/shared/utils/logger.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchRecipesController extends BaseController with PageArgsMixin<SearchRecipesPageArgs> {
  static const _paginationLimit = 10;
  final IRecipeRestService _recipeRestService = Get.find();

  final _recipes = RxList<Recipe>();

  List<Recipe> get recipes => _recipes.value;

  final _searchQuery = RxString('');

  String get searchQuery => _searchQuery.value;

  final _resultsCount = RxInt(0);

  int get resultsCount => _resultsCount.value;

  late final PagingController<int, Recipe> pagingController;
  final TextEditingController searchController = TextEditingController();
  CancelableRequest<RecipeResults>? _requestCancelable;

  SearchRecipesController() {
    pagingController = PagingController<int, Recipe>(firstPageKey: 0);
  }

  @override
  void onReady() {
    super.onReady();
    _searchRecipes(0);
    registerDisposable(_recipes);
    _searchQuery.value = args!.query;
    searchController.text = _searchQuery.value;
    pagingController.addPageRequestListener((pageKey) {
      _searchRecipes(pageKey);
    });
  }

  void _searchRecipes(int pageKey) async {
    execute(() async {
      var query = searchQuery;
      logger.d('Search recipes with query: $query');
      _cancelCurrentRequest();
      _requestCancelable = _recipeRestService.searchRecipes(_searchQuery.value, _paginationLimit, pageKey);
      var results = await _requestCancelable!.run();
      var recipes = results.results;
      _resultsCount.value = results.totalResults;
      logger.d('Found ${recipes.length} recipes with query: $query');
      final isLastPage = recipes.length < _paginationLimit;
      if (isLastPage) {
        pagingController.appendLastPage(recipes);
      } else {
        final nextPageKey = pageKey + recipes.length;
        pagingController.appendPage(recipes, nextPageKey);
      }
      _searchQuery.refresh();
      _requestCancelable = null;
    });
  }

  @override
  void showError(dynamic e, StackTrace? stacktrace) {
    pagingController.error = e;
  }

  void _cancelCurrentRequest() {
    _requestCancelable?.cancel();
    _requestCancelable = null;
  }

  void showRecipeDetails(Recipe recipe) {
    Get.toNamed(
      RecipeDetailsPage.routeName,
      arguments: RecipeDetailsPageArgs(recipe: recipe),
    );
  }

  void searchRecipes(String v, [bool force = false]) {
    if (v != searchQuery || force) {
      _searchQuery.value = v.trim();
      pagingController.refresh();
    }
  }

  @override
  void onClose() {
    _cancelCurrentRequest();
    super.onClose();
  }
}
