import 'package:flutter_sample_app/presentation/getx/pages/main/main_page.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    Future.delayed(1.seconds, () {
      _init();
    });
  }

  Future<void> _init() async {
    Get.offNamed(MainPage.routeName);
  }
}
