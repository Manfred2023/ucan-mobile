// Created by Manfred MOUKATE on 6/25/24, 3:50 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 3:50 PM

import 'package:dio/dio.dart';
import 'package:ucan/data/authentication/service/remote/model/pin_api_response.dart';

import '../../../../app/config/constant.dart';
import '../../../shared/service/remote/base_api_service.dart';
import '../../../shared/service/remote/endpoints.dart';
import '../../../shared/service/remote/network.dart';
import 'model/account_api_model.dart';
import 'model/convert_api_model.dart';
import 'model/motif_api_model.dart';
import 'model/paiement_api_model.dart';
import 'model/resume_api_model.dart';
import 'model/spent_api_model.dart';

class AccountRemote extends BaseApiService {
  AccountRemote();

  Dio _getDio() {
    return Network.createHttpClient(
      baseUrl: Constants.apiBaseUrlDev,
      debugMode: true,
    );
  }

  Future<AccountApiResponse> getAccount({
    required int? token,
  }) async {
    try {
      final response = await _getDio().put(Endpoints.account, data: {
        "token": token,
      });
      if (response.data['status'] == 1) {
        return AccountApiResponse.fromJson(response.data);
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

  Future<ResumeApiResponse> getResume({
    required int? token,
  }) async {
    try {
      final response = await _getDio().put(Endpoints.account, data: {
        "token": token,
      });
      if (response.data['status'] == 1) {
        return ResumeApiResponse.fromJson(response.data);
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

  Future<MotifApiListResponse> getMotif() async {
    try {
      final response = await (_getDio()).get(Endpoints.motif);

      if (response.data['status'] == 1) {
        return MotifApiListResponse.fromJson(response.data);
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

  Future<SpentApiResponse> getSpent({
    required int bubget,
    required String date,
  }) async {
    try {
      final response = await (_getDio()).put(Endpoints.spent, data: {
        "budget": bubget,
        "date": date,
      });

      if (response.data['status'] == 1) {
        return SpentApiResponse.fromJson(response.data);
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

  Future<MotifApiResponse> saveMotif({
    int? token,
    required String name,
  }) async {
    try {
      final response = await (_getDio()).post(Endpoints.saveMotif, data: {
        'token': token,
        'name': name,
      });
      if (response.data['status'] == 1) {
        return MotifApiResponse.fromJson(response.data);
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

  Future<PaiementApiResponse> createPaiement({
    int? token,
    required bool type,
    required String date,
    required int amount,
    required String motif,
    required int auth,
  }) async {
    try {
      final response = await (_getDio()).post(Endpoints.paiement, data: {
        'token': token,
        'datetime': date,
        'amount': amount,
        'motif': motif,
        'user': auth,
        'type': type,
      });

      if (response.data['status'] == 1) {
        return PaiementApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      print(ex);
      throw mapToError(ex);
    }
  }

  Future<PaiementApiListResponse> getPaiement({
    required int? token,
  }) async {
    try {
      final response = await (_getDio()).put(Endpoints.myPaiement, data: {
        "token": token,
      });
      if (response.data['status'] == 1) {
        return PaiementApiListResponse.fromJson(response.data);
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

  Future<PaiementApiListResponse?> getPaiementByDate({
    required int? token,
    required String? start,
    required String? end,
  }) async {
    try {
      final response = await (_getDio()).put(Endpoints.myPaiementByDate, data: {
        "token": token,
        "start": start,
        "end": end,
      });
      if (response.data['status'] == 1) {
        return PaiementApiListResponse.fromJson(response.data);
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

  Future<PinApiResponse> deleteHistory({
    required int? token,
  }) async {
    try {
      final response = await (_getDio()).post(Endpoints.deletePayment, data: {
        "token": token,
      });
      if (response.data['status'] == 1) {
        return PinApiResponse.fromJson(response.data);
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

  Future<ConvertApiResponse> convert({
    required int? number,
  }) async {
    try {
      final response = await (_getDio()).put(
        Endpoints.convert,
        data: {
          "number": number,
        },
      );
      if (response.data['status'] == 1) {
        return ConvertApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      print(ex);
      throw mapToError(ex);
    }
  }
}
