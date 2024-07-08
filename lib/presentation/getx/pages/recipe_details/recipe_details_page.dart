import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

import 'recipe_details_page_controller.dart';

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
          child: Column(
            children: [
              UIPageTitle(
                title: controller.pageTitle,
                showBackButton: true,
              ),
              Container(
                margin: const EdgeInsets.all(padding16),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(padding12),
                ),
                child: CachedNetworkImage(
                  imageUrl: controller.recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
              if (recipe.cuisines?.isNotEmpty == true)
                _featuresList(
                  Icons.flag_circle_rounded,
                  recipe.cuisines!,
                ),
              if (recipe.dishTypes?.isNotEmpty == true)
                _featuresList(
                  Icons.no_food_rounded,
                  recipe.dishTypes!,
                ),
              if (recipe.summary != null)
                Padding(
                  padding: const EdgeInsets.all(padding16),
                  child: Html(
                    data: recipe.summary!,
                    style: {
                      'body': Style(fontSize: FontSize(17)),
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featuresList(IconData icon, List<String> features) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(padding16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: UIColors.primary),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(padding8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var cuisine = features[index];
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: padding8),
                        child: Text(
                          cuisine,
                          style: UITextStyles.regularSmall,
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
        const Divider(height: 1),
      ],
    );
  }
}
