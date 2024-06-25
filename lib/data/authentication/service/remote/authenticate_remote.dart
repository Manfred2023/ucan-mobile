import 'package:dio/dio.dart';

import '../../../../app/config/constant.dart';
import '../../../requirement/service/remote/model/city_api_model.dart';
import "../../../shared/service/remote/base_api_service.dart";
import '../../../shared/service/remote/endpoints.dart';
import '../../../shared/service/remote/network.dart';
import 'model/auth_api_model.dart';
import 'model/contact_api_model.dart';

class AuthenticateRemote extends BaseApiService {
  AuthenticateRemote();

  Future<Dio> _getDio() async {
    return Network.createHttpClient(
      baseUrl: Constants.apiBaseUrlDev,
      debugMode: true,
    );
  }

  Future<ContactApiResponse> createContact({
    int? token,
    String? firstname,
    required String lastname,
    required String mobile,
    required bool gender,
    required String email,
    required String city,
    required String? location,
  }) async {
    try {
      final response =
          await (await _getDio()).post(Endpoints.createContact, data: {
        "token": token,
        "firstname": firstname,
        "lastname": lastname,
        "mobile": mobile,
        "gender": gender,
        "email": email,
        "city": city,
        "location": location,
      });
      if (response.data['status'] == 1) {
        return ContactApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<AuthApiResponse> createUser({
    int? token,
    required int pin,
    required int contact,
  }) async {
    try {
      final response =
          await (await _getDio()).post(Endpoints.createUser, data: {
        "token": token,
        "pin": pin,
        "contact": contact,
      });
      if (response.data['status'] == 1) {
        return AuthApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<ContactApiResponse> getContact({
    required int mobile,
  }) async {
    try {
      final response = await (await _getDio()).put(Endpoints.getContact, data: {
        "mobile": mobile,
      });
      if (response.data['status'] == 1) {
        return ContactApiResponse.fromJson(response.data);
      } else if (response.data?['status'] == 0 &&
          response.data?['message'] == "no_data_available") {
        return ContactApiResponse.fromJson(
            {"status": 0, "type": "reference", "response": []});
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<CityApiResponse> getCities() async {
    try {
      final response = await (await _getDio()).get(Endpoints.city);
      if (response.data['status'] == 1) {
        return CityApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<AuthApiResponse> getUser({
    required int token,
  }) async {
    try {
      final response = await (await _getDio()).put(Endpoints.getUser, data: {
        "token": token,
      });
      if (response.data['status'] == 1) {
        return AuthApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<AuthApiResponse> auth({
    required int pin,
    required int code,
  }) async {
    try {
      final response = await (await _getDio()).put(Endpoints.auth, data: {
        "pin": pin,
        "code": code,
      });
      if (response.data['status'] == 1) {
        return AuthApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }
}
