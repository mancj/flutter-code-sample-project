import 'package:get/get.dart';

import 'recipe_details_page_controller.dart';

class RecipeDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecipeDetailsController());
  }

}
