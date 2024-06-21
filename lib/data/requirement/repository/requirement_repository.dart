import 'package:ucan/data/authentication/model/authentication.dart';

abstract class RequirementRepository {
  Future<List<City>> getCities();
  Future<List<Country>> getCountry();
}
