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

  late final PagingController<int, Recipe> pagingController;
  final TextEditingController searchController = TextEditingController();
  CancelableRequest<List<Recipe>>? _requestCancelable;
  StreamSubscription? _streamSubscription;

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
    try {
      var query = searchQuery;
      logger.d('Search recipes with query: $query');
      _cancelCurrentRequest();
      _requestCancelable = _recipeRestService.searchRecipes(_searchQuery.value, _paginationLimit, pageKey);
      _streamSubscription = _requestCancelable!.run().asStream().listen((recipes) {
        logger.d('Found ${recipes.length} recipes with query: $query');
        final isLastPage = recipes.length < _paginationLimit;
        if (isLastPage) {
          pagingController.appendLastPage(recipes);
        } else {
          final nextPageKey = pageKey + recipes.length;
          pagingController.appendPage(recipes, nextPageKey);
        }
        _requestCancelable = null;
      });
    } catch (error) {
      pagingController.error = error;
    }
  }

  void _cancelCurrentRequest() {
    _streamSubscription?.cancel();
    _requestCancelable?.cancel();
  }

  void showRecipeDetails(Recipe recipe) {
    Get.toNamed(
      RecipeDetailsPage.routeName,
      arguments: RecipeDetailsPageArgs(recipe: recipe),
    );
  }

  void searchRecipes(String v) {
    _searchQuery.value = v.trim();
    pagingController.refresh();
    _searchRecipes(0);
  }

  @override
  void onClose() {
    _cancelCurrentRequest();
    super.onClose();
  }
}
