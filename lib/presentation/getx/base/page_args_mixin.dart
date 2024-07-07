import 'package:get/get.dart';

mixin PageArgsMixin<T> on GetxController {
  T? get args => Get.arguments != null ? Get.arguments as T : null;
}
