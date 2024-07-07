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

  @override
  void onClose() {
    for (var element in disposables) {
      element.close();
    }
    super.onClose();
  }
}
