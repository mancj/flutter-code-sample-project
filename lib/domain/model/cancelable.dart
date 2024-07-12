abstract class CancelableRequest<T> {
  void cancel();

  Future<T> run();
}
