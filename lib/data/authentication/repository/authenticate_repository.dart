import 'package:ucan/data/authentication/model/authentication.dart';

import '../service/remote/authenticate_remote.dart';

class AuthenticateRepository {
  final AuthenticateRemote _authenticate;

  AuthenticateRepository(this._authenticate);

  Future<Contact> createContact({
    int? token,
    String? firstname,
    required String lastname,
    required String mobile,
    required bool gender,
    required String email,
    required String city,
    required String? location,
  }) async {
    final response = await _authenticate.createContact(
        lastname: lastname,
        mobile: mobile,
        gender: gender,
        email: email,
        city: city,
        location: location);
    return response.response!.toContact();
  }

  Future<Authentication> createUser({
    int? token,
    required int pin,
    required int code,
    required int contact,
  }) async {
    final response = await _authenticate.createUser(
      token: token,
      pin: pin,
      code: code,
      contact: contact,
    );
    return response.response!.toAuth();
  }
}
