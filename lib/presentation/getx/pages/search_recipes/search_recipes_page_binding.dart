import 'package:get/get.dart';

import 'search_recipes_page_controller.dart';

class SearchRecipesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchRecipesController());
  }

}
