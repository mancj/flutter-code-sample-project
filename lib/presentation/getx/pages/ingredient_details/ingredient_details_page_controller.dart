import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/domain/model/_model.dart';
import 'package:flutter_sample_app/presentation/getx/base/base_controller.dart';
import 'package:flutter_sample_app/presentation/getx/base/page_args_mixin.dart';
import 'package:flutter_sample_app/presentation/getx/pages/ingredient_details/ingredient_details_page.dart';
import 'package:get/get.dart';

class IngredientDetailsController extends BaseController with PageArgsMixin<IngredientPageArgs> {
  final IRecipeRestService _recipeRestService = Get.find();

  String get pageTitle => args!.ingredient.name;
  final _ingredient = Rxn<IngredientDetails>();

  IngredientDetails? get ingredient => _ingredient.value;

  @override
  void onReady() {
    super.onReady();
    _fetchIngredients();
  }

  Future<void> _fetchIngredients() async {
    await execute(() async {
      await Future.delayed(1.seconds, () {}); // fake timeout
      _ingredient.value = await _recipeRestService.fetchIngredientDetails(args!.ingredient.id);
    });
  }
}
