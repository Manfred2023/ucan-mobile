import 'package:ucan/data/authentication/model/authentication.dart';

import '../service/remote/requirement_api_service.dart';
import 'requirement_repository.dart';

class RequirementDataRepository extends RequirementRepository {
  final RequirementApiService _apiService;

  RequirementDataRepository(
    this._apiService,
  );

  @override
  Future<List<City>> getCities() async {
    final response = await _apiService.getCities();
    return response.response!.map((e) => e.toCity()).toList();
  }

  @override
  Future<List<Country>> getCountry() async {
    final response = await _apiService.getCountry();
    return response.response!.map((e) => e.toCountry()).toList();
  }
}
