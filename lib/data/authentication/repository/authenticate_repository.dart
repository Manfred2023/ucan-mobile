import 'package:firebase_auth/firebase_auth.dart';

import '../service/remote/authenticate_remote.dart';

class AuthenticateRepository {
  final AuthenticateRemote _authenticate;

  AuthenticateRepository(this._authenticate);

  Future<User?> signup(
      {required String emailAddress,
      required String userName,
      required String password}) async {
    final response = await _authenticate.signup(
        email: emailAddress, password: password, userName: userName);

    return response;
  }

  Future<void> signin(
      {required String emailAddress, required String password}) async {
    await _authenticate.signin(emailAddress: emailAddress, password: password);
  }

  Future<User> phoneAuthentication({required String phone}) async {
    final response = await _authenticate.phoneAuthentication(phone: phone);

    return response;
  }
}
