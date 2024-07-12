import 'package:dio/dio.dart';
import 'package:flutter_sample_app/domain/model/cancelable.dart';
import 'package:flutter_sample_app/presentation/shared/utils/logger.dart';

class CancelableApiRequest<T> extends CancelableRequest<T> {
  CancelToken cancelToken = CancelToken();
  final Future<T> Function(CancelToken token) request;

  CancelableApiRequest(this.request);

  @override
  void cancel() {
    cancelToken.cancel();
    logger.d('Cancel token ${cancelToken.hashCode} ${cancelToken.isCancelled}');
  }

  @override
  Future<T> run() async {
    logger.d('Run request with token ${cancelToken.hashCode} ${cancelToken.isCancelled}');
    await Future.delayed(const Duration(seconds: 10));
    return await request(cancelToken);
  }
}
