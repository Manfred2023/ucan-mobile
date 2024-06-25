import '../../model/authentication.dart';
import 'model/authentication_db.dart';
import 'model/city_db.dart';
import 'model/contact_db.dart';
import 'model/country_db.dart';

class AuthenticationDbService {
  Future<void> save(Contact contact) async {
    await ContactDb.delete();
    if (contact.city != null) {
      await (await CountryDb.fromCountry(contact.city!.country)).save();
      await (await CityDb.fromCity(contact.city!)).save();
    }

    await (await ContactDb.fromContact(contact)).save();
  }

  Future<void> saveAuth(Authentication auth) async {
    await AuthenticationDb.delete();

    if (auth.contact != null) {
      await (await CountryDb.fromCountry(auth.contact!.city!.country)).save();
      await (await CityDb.fromCity(auth.contact!.city!)).save();
      await (await ContactDb.fromContact(auth.contact!)).save();
    }
    await (await AuthenticationDb.fromAuthentication(auth)).save();
  }

  Future<AuthenticationDb?> get() async {
    return AuthenticationDb.get();
  }

  Future<ContactDb?> getContact() async {
    return ContactDb.get();
  }

  Future<AuthenticationDb?> getAuth() async {
    return AuthenticationDb.get();
  }

  Future<int> clear() async {
    return AuthenticationDb.delete();
  }
}
