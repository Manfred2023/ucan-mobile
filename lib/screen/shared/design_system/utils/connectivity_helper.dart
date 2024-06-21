import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/config/constant.dart';
import '../../../../app/navigation/route.dart';

class ConnectivityHelper {
  static const noInternet =
      "an_error_has_occurred_check_your_internet_connection_and_try_again";

  static Future<bool> isConnected() {
    return Connectivity().checkConnectivity().then((connectivityResult) async {
      try {
        final response = await Dio(BaseOptions(
                baseUrl: Constants.googleURL,
                connectTimeout: const Duration(seconds: 10)))
            .get('/');

        if (response.statusCode == 200) return true;
        final internetAvailable =
            (connectivityResult == ConnectivityResult.mobile ||
                connectivityResult == ConnectivityResult.wifi);
        return internetAvailable;
      } catch (e) {
        return false;
      }
    });
  }

  static Stream<bool> onIsConnectedChanged() {
    return Connectivity().onConnectivityChanged.map((connectivityResult) =>
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);
  }

  static Future<String?> internetRoute(BuildContext context,
      {required String message, required Function function}) async {
    if (message == ConnectivityHelper.noInternet) {
      final isOk = await Navigator.of(context).pushNamed(Routes.checkConnection)
          as bool?;
      if (isOk != null) {
        function();
      }
      return null;
    }
    return null;
  }
}
