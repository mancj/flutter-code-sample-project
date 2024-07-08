import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:get/get.dart';

import 'main_page_controller.dart';

export 'main_page_binding.dart';
export 'main_page_controller.dart';

class MainPage extends GetView<MainController> {
  static const routeName = '/main';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UIPageTitle(
                  title: 'Find best recipes for cooking',
                ),
                UIInputField(
                  onSubmitted: (query) => controller.searchRecipes(query),
                ),
                _sectionTitle('Trending recipes 🔥'),
                _trendingRecipes(),
                _sectionTitle('Popular category'),
                _popularCategoryPicker(),
                _popularRecipesCategory(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: UITextStyles.boldH5,
      ),
    );
  }

  Widget _trendingRecipes() {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => Obx(() {
          final width = Get.width - 56;
          if (!controller.isTrendingRecipesLoading) {
            var recipe = controller.trendingRecipes[index];
            return TransparentGestureDetector(
              onTap: () => controller.showRecipeDetails(recipe),
              child: RecipeCardBig(
                recipe: recipe,
                width: width,
              ),
            );
          } else {
            return RecipeCardBig.shimmer(width);
          }
        }),
        itemCount: controller.isTrendingRecipesLoading ? 3 : controller.trendingRecipes.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _popularCategoryPicker() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: padding16),
      width: double.infinity,
      height: 46,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(
            () {
              var isSelected = controller.selectedPopularCategoryId == index;
              return TransparentGestureDetector(
                onTap: () => controller.setSelectedPopularCategoryId(index),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: padding16),
                  margin: const EdgeInsets.only(right: padding8),
                  decoration: BoxDecoration(
                    color: isSelected ? UIColors.primary : null,
                    borderRadius: BorderRadius.circular(padding12),
                  ),
                  child: Text(
                    controller.popularCategories[index],
                    style: UITextStyles.boldSmall.copyWith(
                      color: isSelected ? UIColors.white : UIColors.primary40,
                    ),
                  ),
                ),
              );
            },
          );
        },
        itemCount: controller.popularCategories.length,
      ),
    );
  }

  Widget _popularRecipesCategory() {
    return SizedBox(
      width: double.infinity,
      height: 330,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => Obx(() {
          if (!controller.isPopularRecipesCategoryLoading) {
            var recipe = controller.popularRecipesCategory[index];
            return TransparentGestureDetector(
              child: RecipeCardSmall(recipe),
              onTap: ()=>controller.showRecipeDetails(recipe),
            );
          } else {
            return RecipeCardSmall.shimmer();
          }
        }),
        itemCount: controller.isPopularRecipesCategoryLoading ? 3 : controller.popularRecipesCategory.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
