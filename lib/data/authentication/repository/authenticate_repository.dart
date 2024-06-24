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
        firstname: firstname,
        lastname: lastname,
        mobile: mobile,
        gender: gender,
        email: email,
        city: city,
        location: location);
    return response.response!.toContact();
  }

  Future<Contact> getContact({
    required int mobile,
  }) async {
    final response = await _authenticate.getContact(
      mobile: mobile,
    );
    return response.response!.toContact();
  }

  Future<Authentication> getUser({
    required int token,
  }) async {
    final response = await _authenticate.getUser(
      token: token,
    );
    return response.response!.toAuth();
  }

  Future<Authentication> createUser({
    int? token,
    required int pin,
    required int contact,
  }) async {
    final response = await _authenticate.createUser(
      token: token,
      pin: pin,
      contact: contact,
    );
    return response.response!.toAuth();
  }

  Future<Authentication> auth({
    required int pin,
    required int code,
  }) async {
    final response = await _authenticate.auth(
      pin: pin,
      code: code,
    );
    return response.response!.toAuth();
  }
}
