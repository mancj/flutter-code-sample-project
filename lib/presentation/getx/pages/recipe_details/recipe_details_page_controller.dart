import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/page_args_mixin.dart';
import 'package:flutter_sample_app/presentation/getx/pages/recipe_details/recipe_details_page.dart';
import 'package:get/get.dart';

class RecipeDetailsController extends GetxController with PageArgsMixin<RecipeDetailsPageArgs> {
  String get pageTitle => args!.recipe.title;
  Recipe get recipe => args!.recipe;
}
