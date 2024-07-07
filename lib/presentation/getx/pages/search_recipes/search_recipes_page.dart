import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UIMargin.vertical16(),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UIPageTitle(
                    title: 'Search',
                    showBackButton: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      '${controller.searchQuery} results:',
                      style: UITextStyles.regularParagraph.copyWith(
                        color: UIColors.black80,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const UIMargin.vertical16(),
            Obx(
              () => _recipesList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _recipesList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (controller.isLoading) {
            return Container(
              margin: const EdgeInsets.fromLTRB(padding16, padding0, padding16, padding32),
              child: RecipeCardBig.shimmer(double.infinity),
            );
          } else {
            var recipe = controller.recipes[index];
            return RecipeCardBig(
              recipe: recipe,
              width: Get.width,
              margin: const EdgeInsets.fromLTRB(padding16, padding0, padding16, padding32),
            );
          }
        },
        itemCount: controller.isLoading ? 3 : controller.recipes.length,
      ),
    );
  }
}
