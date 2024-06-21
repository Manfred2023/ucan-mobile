import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  ApiKeyInterceptor(this.apiKey);
  final String apiKey;
  static const String _apiKey = 'apiKey';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters[_apiKey] = apiKey;

    super.onRequest(options, handler);
  }
}
