import 'package:dio/dio.dart';
import 'package:logging_flutter/logging_flutter.dart';

import '../../../../screen/shared/design_system/utils/connectivity_helper.dart';
import '../../model/error/data_error.dart';
import 'model/api_error_response.dart';

abstract class BaseApiService {
  Exception mapToError(Object exception) {
    if (exception is DioError) {
      Flogger.i(
        "Dio Error has occurred while making a request with status code: ${exception.response?.statusCode} || ${exception.response?.statusMessage}",
      );
      if (exception.type == DioErrorType.connectionTimeout) {
        return const DataError.unknown(error: ConnectivityHelper.noInternet);
      }
      switch (exception.response?.statusCode) {
        case 404:
          return const DataError.error404();
        case 402:
          return const DataError.error404();
        case 400:
          return const DataError.error404();
        case 500:
          return const DataError.error404();
        default:
          try {
            final apiError =
                ApiErrorResponse.fromJson(exception.response!.data);
            if (apiError.status == -1) {
              return DataError.authError(
                reason: apiError.message ?? apiError.response,
              );
            }

            return DataError.apiError(
              reason: apiError.message ?? apiError.response,
            );
          } catch (e) {
            if (exception.error.toString().contains('SocketException')) {
              return const DataError.unknown(
                  error: ConnectivityHelper.noInternet);
            }
            if (exception.error.toString().contains('<br />')) {
              return const DataError.unknown(error: 'remote_server_error');
            }

            return DataError.unknown(error: exception.error);
          }
      }
    } else {
      Flogger.i(
        "An unknown error has occurred while making a request - $exception",
      );
      return DataError.unknown(error: exception);
    }
  }
}
