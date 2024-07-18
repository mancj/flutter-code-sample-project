import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/ui_kit/picker_bar.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/ui_kit/transparent_gesture_detector.dart';
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
          () => RefreshIndicator(
            displacement: 20,
            onRefresh: () async {
              controller.refreshPage();
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UIPageTitle(
                    title: 'Find best recipes for cooking',
                  ),
                  UIInputField(
                    controller: controller.searchFieldController,
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
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: UITextStyles.boldH5,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TransparentGestureDetector(
            onTap: () => showUnimplementedDialog(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'See all',
                style: UITextStyles.mediumSmall.copyWith(
                  color: UIColors.primary,
                ),
              ),
            ),
          ),
        ],
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
    return PickerBarWidget(
      items: controller.popularCategories,
      onChanged: (int index) {
        controller.setSelectedPopularCategoryId(index);
      },
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
              onTap: () => controller.showRecipeDetails(recipe),
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
