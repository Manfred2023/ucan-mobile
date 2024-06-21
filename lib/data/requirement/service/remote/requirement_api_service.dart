import 'package:dio/dio.dart';

import '../../../../app/config/constant.dart';
import '../../../shared/service/remote/base_api_service.dart';
import '../../../shared/service/remote/endpoints.dart';
import '../../../shared/service/remote/network.dart';
import 'model/city_api_model.dart';
import 'model/country_api_model.dart';

class RequirementApiService extends BaseApiService {
  RequirementApiService();

  Future<Dio> _getDio() async {
    return Network.createHttpClient(
      baseUrl: Constants.apiBaseUrlDev,
      debugMode: true,
    );
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

  Future<CountryApiResponse> getCountry() async {
    try {
      final response = await (await _getDio()).get(Endpoints.country);
      if (response.data['status'] == 1) {
        return CountryApiResponse.fromJson(response.data);
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
