import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample_app/data/api/interceptors/spoonacular_api_key_interceptor.dart';
import 'package:flutter_sample_app/data/di/dependency_factory.dart';

class DioDependencyFactory extends IDependencyFactory<Dio> {
  @override
  Dio create() {
    return Dio(BaseOptions(baseUrl: 'https://api.spoonacular.com/'))
      ..interceptors.addAll(
        [
          if (kDebugMode && true)
            LogInterceptor(
              responseBody: true,
              requestHeader: false,
              responseHeader: false,
            ),
          SpoonacularApiKeyInterceptor(),
        ],
      );
  }
}
