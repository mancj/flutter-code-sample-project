import 'package:get/get.dart';

import 'ingredient_details_page_controller.dart';

class IngredientDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IngredientDetailsController());
  }

}
