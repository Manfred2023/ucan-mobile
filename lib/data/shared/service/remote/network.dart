import 'package:dio/dio.dart';
import 'package:logging_flutter/logging_flutter.dart';

import 'interceptors/api_key_interceptor.dart';
import 'interceptors/auth_basic_interceptor.dart';
import 'interceptors/auth_token_interceptor.dart';
import 'interceptors/curl_intercerptor.dart';
import 'interceptors/firebase_performance_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

abstract class Network {
  static Dio createHttpClient({
    required final String baseUrl,
    final String? apiKey,
    final String? base64Credentials,
    Future<String?> Function()? getBearerToken,
    required bool debugMode,
  }) {
    // Create Dio Client
    final dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 20)),
    )..interceptors.addAll(
        [
          // Add Bearer Token
          if (getBearerToken != null) AuthTokenInterceptor(getBearerToken()),
          // Add Basic Auth
          if (base64Credentials != null)
            AuthBasicInterceptor(base64Credentials),
          // Add API Key
          if (apiKey != null) ApiKeyInterceptor(apiKey),
          // Firebase Performance Monitoring
          if (!debugMode) FirebasePerformanceInterceptor(),
          // Curl
          CurlInterceptor(
            logPrint: (message) => Flogger.d(message, loggerName: "Curl"),
          ),
          // Logs
          LoggingInterceptor(
            logPrint: (message) =>
                Flogger.d(message.toString(), loggerName: "Dio"),
          ),
        ],
      );

    return dio;
  }
}
