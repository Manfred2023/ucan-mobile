import 'package:ucan/data/authentication/model/authentication.dart';
import 'package:ucan/data/authentication/service/local/model/country_db.dart';

class RequirementDbService {
  Future<void> saveCountries(List<Country> countries) async {
    print('result');
    await CountryDb.delete();
    for (Country country in countries) {
      await CountryDb(
              code: country.code,
              nameen: country.nameen,
              namefr: country.namefr,
              alpha1: country.alpha1,
              alpha2: country.alpha2,
              dialcode: country.dialcode)
          .save();
    }
  }
}
