import 'package:ucan/data/authentication/model/authentication.dart';

import 'requirement_repository.dart';

class RequirementMockRepository extends RequirementRepository {
  @override
  Future<List<City>> getCities() {
    // TODO: implement getCities
    throw UnimplementedError();
  }

  @override
  Future<List<Country>> getCountry() {
    // TODO: implement getCountry
    throw UnimplementedError();
  }
}
