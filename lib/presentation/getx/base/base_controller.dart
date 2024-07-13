import 'package:flutter_sample_app/presentation/shared/utils/logger.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final _isLoading = RxBool(false);
  final List<RxInterface> disposables = List.empty(growable: true);

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) {
    _isLoading.value = value;
  }

  void registerDisposable(RxInterface disposable) {
    disposables.add(disposable);
  }

  void registerDisposables(List<RxInterface> disposables) {
    this.disposables.addAll(disposables);
  }

  Future<void> withLoading(
    Future<dynamic> Function() func, {
    RxBool? loadingFlag,
  }) async {
    (loadingFlag ?? _isLoading).value = true;
    await func();
    (loadingFlag ?? _isLoading).value = false;
  }

  Future<void> execute<T>(
    Future<T> Function() call, {
    Function(dynamic e)? onError,
  }) async {
    try {
      await call();
    } catch (e, s) {
      isLoading = false;
      this.onError(e, s);
      onError?.call(e);
    }
  }

  void onError(dynamic e, StackTrace? stacktrace) {
    logger.e(e, stackTrace: stacktrace);
    logger.d('$stacktrace');
    isLoading = false;
    showError(e, stacktrace);
  }

  void showError(dynamic e, StackTrace? stacktrace) {
    Get.snackbar(
      'Something Went Wrong',
      'An unexpected error occurred. Please try again later',
      snackPosition: SnackPosition.BOTTOM,
    ).show();
  }

  @override
  void onClose() {
    for (var element in disposables) {
      element.close();
    }
    super.onClose();
  }
}
