import 'package:dio/dio.dart';
import 'package:flutter_sample_app/data/api/constants.dart';

class SpoonacularApiKeyInterceptor extends Interceptor {
  SpoonacularApiKeyInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] = spoonacularApiKey;
    super.onRequest(options, handler);
  }
}
