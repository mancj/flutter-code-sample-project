import 'package:dio/dio.dart';
import 'package:flutter_sample_app/data/api/recipe_rest_service.dart';
import 'package:flutter_sample_app/data/di/dio_dependency_factory.dart';
import 'package:flutter_sample_app/domain/api/recipe_rest_service.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioDependencyFactory().create());
    Get.put<IRecipeRestService>(
      RecipeRestService(Get.find<Dio>()),
    );
  }

  Future<void> asyncDependencies() async {
    /*await Get.putAsync(() async {
      // return await SampleFactory.create();
    });*/
  }
}
