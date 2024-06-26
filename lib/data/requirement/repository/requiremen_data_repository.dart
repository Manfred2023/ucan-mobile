import 'package:ucan/data/authentication/model/authentication.dart';

import '../service/local/requirement_db_service.dart';
import '../service/remote/requirement_api_service.dart';
import 'requirement_repository.dart';

class RequirementDataRepository extends RequirementRepository {
  final RequirementApiService _apiService;
  final RequirementDbService _dbService;

  RequirementDataRepository(
    this._apiService,
    this._dbService,
  );

  @override
  Future<List<City>> getCities() async {
    final response = await _apiService.getCities();
    return response.response!.map((e) => e.toCity()).toList();
  }

  @override
  Future<List<Country>> getCountry() async {
    final response = await _apiService.getCountry();
    final country = response.response!.map((e) => e.toCountry()).toList();
    if (country.isNotEmpty) await _dbService.saveCountries(country);
    return country;
  }
}
