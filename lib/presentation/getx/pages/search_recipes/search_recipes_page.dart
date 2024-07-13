import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'search_recipes_page_controller.dart';

export 'search_recipes_page_binding.dart';
export 'search_recipes_page_controller.dart';

part 'search_recipes_page.freezed.dart';

@freezed
class SearchRecipesPageArgs with _$SearchRecipesPageArgs {
  const factory SearchRecipesPageArgs({
    required String query,
  }) = _SearchRecipesPageArgs;
}

class SearchRecipesPage extends GetView<SearchRecipesController> {
  static const routeName = '/search_recipes';

  const SearchRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UIMargin.vertical16(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIPageTitle(title: 'Search', showBackButton: true),
              ],
            ),
            UIInputField(
              controller: controller.searchController,
              onSubmitted: (v) => controller.searchRecipes(v),
            ),
            Obx(() {
              return !controller.isLoading ? _resultsCountHeaderWidget() : _searchingTitleWidget();
            }),
            const UIMargin.vertical16(),
            _recipesList(),
          ],
        ),
      ),
    );
  }

  Widget _searchingTitleWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Searching recipes for ',
              style: UITextStyles.regularLabel,
            ),
            TextSpan(
              text: controller.searchQuery,
              style: UITextStyles.boldLabel,
            ),
            const TextSpan(
              text: ', please wait',
              style: UITextStyles.regularLabel,
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultsCountHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '${controller.resultsCount}',
              style: UITextStyles.boldLabel.copyWith(
                color: UIColors.black80,
              ),
            ),
            TextSpan(
              text: ' matches for ',
              style: UITextStyles.regularLabel.copyWith(
                color: UIColors.black80,
              ),
            ),
            TextSpan(
              text: '${controller.searchQuery}:',
              style: UITextStyles.boldLabel.copyWith(
                color: UIColors.black80,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recipesList() {
    return Expanded(
      child: PagedListView<int, Recipe>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (BuildContext context, recipe, int index) {
            // var recipe = controller.recipes[index];
            return TransparentGestureDetector(
              onTap: () => controller.showRecipeDetails(recipe),
              child: RecipeCardBig(
                recipe: recipe,
                width: Get.width,
                margin: const EdgeInsets.fromLTRB(padding16, padding0, padding16, padding32),
              ),
            );
          },
          firstPageErrorIndicatorBuilder: (c) {
            return _errorPageWidget();
          },
          firstPageProgressIndicatorBuilder: (c) => const CircularProgressIndicator.adaptive(),
          newPageProgressIndicatorBuilder: (c) => const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  Widget _errorPageWidget() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Something went wrong',
            style: UITextStyles.boldH5,
          ),
          const UIMargin.vertical(16),
          Text(
            'Couldn\'t load recipes due to unknown error. Please try again later',
            style: UITextStyles.regularSmall.copyWith(color: UIColors.black60),
            textAlign: TextAlign.center,
          ),
          const UIMargin.vertical(24),
          FilledButton(
            onPressed: () => controller.searchRecipes(controller.searchQuery, true),
            child: Text(
              'Try again',
              style: UITextStyles.regularSmall.copyWith(color: UIColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
