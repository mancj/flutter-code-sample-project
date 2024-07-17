export 'ingredient_details_page_controller.dart';
export 'ingredient_details_page_binding.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/_app_widgets.dart';
import 'package:flutter_sample_app/presentation/shared/widgets/ui_kit/loading_indicator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'ingredient_details_page_controller.dart';

part 'ingredient_details_page.freezed.dart';

@freezed
class IngredientPageArgs with _$IngredientPageArgs {
  const factory IngredientPageArgs({
    required Ingredient ingredient,
  }) = _IngredientPageArgs;
}

/// TODO WIP
class IngredientDetailsPage extends GetView<IngredientDetailsController> {
  static const routeName = '/ingredient_details';

  const IngredientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UIPageTitle(
              title: controller.pageTitle.capitalizeFirst!,
              showBackButton: true,
            ),
            Obx(
              () => Expanded(
                child: controller.isLoading
                    ? const LoadingIndicator(
                        title: 'Loading ingredient',
                      )
                    : _ingredientDetailsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ingredientDetailsWidget() {
    var ingredient = controller.ingredient!;
    return Column(
      children: [
        Text(ingredient.localizedName ?? ingredient.name ?? ""),
      ],
    );
  }
}