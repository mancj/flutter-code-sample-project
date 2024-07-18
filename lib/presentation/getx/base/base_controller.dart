import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_app/data/api/models/spoonacular_error.dart';
import 'package:flutter_sample_app/presentation/shared/resources/_ui_resources.dart';
import 'package:flutter_sample_app/presentation/shared/utils/logger.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final _isLoading = RxBool(false);
  final List<RxInterface> disposables = List.empty(growable: true);

  bool get isLoading => _isLoading.value;
  SnackbarController? _errorSnackbar;

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
    bool withLoading = true,
    RxBool? loadingFlag,
    Function(dynamic e)? onError,
  }) async {
    try {
      if (withLoading) {
        await this.withLoading(() => call(), loadingFlag: loadingFlag);
      } else {
        await call();
      }
    } catch (e, s) {
      isLoading = false;
      this.onError(e, s);
      onError?.call(e);
    }
  }

  void onError(dynamic e, StackTrace? stacktrace) {
    if (e is DioException) {
      if (CancelToken.isCancel(e)) {
        logger.d('The request was manually cancelled by the user. $e');
      } else {
        showError(e, stacktrace);
      }
    } else {
      logger.e(e, stackTrace: stacktrace);
      logger.d('$stacktrace');
      isLoading = false;
      showError(e, stacktrace);
    }
  }

  Future showError(dynamic e, StackTrace? stacktrace) async {
    String title = 'Something Went Wrong';
    String message = 'An unexpected error occurred. Please try again later';
    try {
      var spoonacularError = SpoonacularError.fromJson(e.response?.data);
      message = spoonacularError.message;
    } catch (e) {
      print(e);
    }

    if(Get.isSnackbarOpen) {
      await _errorSnackbar?.close();
      _errorSnackbar = null;
    }
    _errorSnackbar = Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16.0),
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void onClose() {
    for (var element in disposables) {
      element.close();
    }
    super.onClose();
  }
}
