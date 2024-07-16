import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/pages/recipe_details/recipe_details_page.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/ui_kit/picker_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

export 'models/selected_tab_type.dart';
export 'recipe_details_page_binding.dart';
export 'recipe_details_page_controller.dart';

part 'recipe_details_page.freezed.dart';

@freezed
class RecipeDetailsPageArgs with _$RecipeDetailsPageArgs {
  const factory RecipeDetailsPageArgs({required Recipe recipe}) = _RecipeDetailsPageArgs;
}

class RecipeDetailsPage extends GetView<RecipeDetailsController> {
  static const routeName = '/recipe_details';

  const RecipeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var recipe = controller.recipe;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                UIPageTitle(
                  title: controller.pageTitle,
                  showBackButton: true,
                ),
                if (controller.recipe.image != null)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(padding16),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(padding12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: controller.recipe.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (recipe.cuisines?.isNotEmpty == true)
                  _featuresList(
                    UISVGAssets.soup,
                    recipe.cuisines!,
                  ),
                if (recipe.dishTypes?.isNotEmpty == true)
                  _featuresList(
                    UISVGAssets.salad,
                    recipe.dishTypes!,
                  ),
                SizedBox(
                  width: double.infinity,
                  child: PickerBarWidget(
                    items: const ["Info", "Ingredients", "Steps"],
                    onChanged: (int index) => controller.setSelectedTypeIndex(index),
                  ),
                ),
                AnimatedSwitcher(
                  // key: ValueKey(controller.selectedTab),
                  duration: 300.milliseconds,
                  child: _contentWidget(recipe),
                ),
                if (controller.similarRecipes.isNotEmpty) _similarRecipes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _similarRecipes() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(padding16),
          child: Text('Similar recipes', style: UITextStyles.boldH5),
        ),
        SizedBox(
          width: double.infinity,
          height: 360,
          child: ListView.builder(
            padding: const EdgeInsets.all(padding16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var recipe = controller.similarRecipes[index];
              return RecipeCardSmall(recipe);
            },
            itemCount: controller.similarRecipes.length,
          ),
        ),
      ],
    );
  }

  Widget _contentWidget(Recipe recipe) {
    return switch (controller.selectedTab) {
      SelectedTabType.info => Padding(
          padding: const EdgeInsets.all(padding16),
          child: Html(
            data: recipe.summary!,
            style: {
              'body': Style(fontSize: FontSize(17)),
            },
          ),
        ),
      SelectedTabType.ingredients => _contentOrLoadingWidget(
          title: 'Ingredients',
          content: IngredientsList(
            ingredients: controller.ingredients,
          ),
        ),
      SelectedTabType.steps => _contentOrLoadingWidget(
          content: _steps(recipe),
          title: 'Steps',
        ),
    };
  }

  Widget _steps(Recipe recipe) {
    return Column(
      children: recipe.analyzedInstructions == null
          ? List.empty()
          : recipe.analyzedInstructions!
              .expand((element) => element.steps)
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(padding16),
                      child: Text(
                        'Step ${e.number}:',
                        style: UITextStyles.boldParagraph,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(padding16),
                      child: Text(e.step),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(padding16, padding16, padding16, 0),
                      child: Text('Ingredients:', style: UITextStyles.boldLabel),
                    ),
                    Wrap(
                      children: [
                        ...e.ingredients.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(padding8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedNetworkImage(imageUrl: e.image, width: 24, height: 24),
                                const UIMargin.horizontal(padding8),
                                Text(e.name.capitalizeFirst!),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(padding16),
                      child: DashedLineView(color: UIColors.neutral20),
                    ),
                  ],
                ),
              )
              .toList(),
    );
  }

  Widget _contentOrLoadingWidget({required String title, required Widget content}) {
    return controller.isLoading
        ? Container(
            constraints: const BoxConstraints(minHeight: 180),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(UIImages.vegan, width: 100),
                const Text('Crafting recipe', style: UITextStyles.boldLabel),
                Text('Please wait', style: UITextStyles.regularSmall.copyWith(color: UIColors.black60)),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(padding16),
                child: Text(title, style: UITextStyles.boldH5),
              ),
              content,
            ],
          );
  }

  Widget _featuresList(String svgPath, List<String> features) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(padding16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(svgPath, color: UIColors.primary, width: 32),
              Expanded(
                child: SizedBox(
                  height: 46,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(padding8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var cuisine = features[index];
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: UIColors.neutral10,
                          borderRadius: BorderRadius.circular(padding12),
                        ),
                        margin: const EdgeInsets.only(right: padding8),
                        padding: const EdgeInsets.symmetric(horizontal: padding8),
                        child: Text(
                          cuisine.capitalizeFirst!,
                          style: UITextStyles.mediumTiny.copyWith(color: UIColors.primary),
                        ),
                      );
                    },
                    itemCount: features.length,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: padding16),
          child: DashedLineView(),
        ),
      ],
    );
  }
}
