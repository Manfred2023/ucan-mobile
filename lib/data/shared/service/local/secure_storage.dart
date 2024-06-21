import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Use this class to store sensitive user-data
/// that will only be persisted locally during the user session
class SecureStorage {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();
  static const _kUserId = 'userId';
  static const _kUserAuthToken = 'userAuthToken';
  static const _kUserName = 'userName'; // TOKEN-UNIQUEID
  static const _kContact = 'contact'; // CONTACT
  static const _kPassword = 'password'; // password
  static const _kActive = 'active'; // password
  static const _kVersion = 'version'; // password

  // region User
  Future<String?> getUserId() async {
    return _flutterSecureStorage.read(key: _kUserId);
  }

  Future<void> saveUserId(String id) async {
    await _flutterSecureStorage.write(key: _kUserId, value: id);
  }

  Future<String?> getUserAuthToken() async {
    return _flutterSecureStorage.read(key: _kUserAuthToken);
  }

  Future<String?> getVersionApp() async {
    return _flutterSecureStorage.read(key: _kVersion);
  }

  Future<void> saveUserAuthToken(String token) async {
    await _flutterSecureStorage.write(key: _kUserAuthToken, value: token);
  }

  Future<void> saveVersionApp(String version) async {
    await _flutterSecureStorage.write(key: _kVersion, value: version);
  }

  Future<String?> getUserName() async {
    return _flutterSecureStorage.read(key: _kUserName);
  }

  Future<void> saveContactNumber(String number) async {
    return _flutterSecureStorage.write(key: _kContact, value: number);
  }

  Future<String?> getContactNumber() async {
    return _flutterSecureStorage.read(key: _kContact);
  }

  Future<void> saveUserName(String token, String uniqueId) async {
    await _flutterSecureStorage.write(
        key: _kUserName, value: '$token-$uniqueId');
  }

  Future<void> saveActiveAccount(bool active) async {
    await _flutterSecureStorage.write(key: _kActive, value: active.toString());
  }

  Future<String?> getPassWord() async {
    return _flutterSecureStorage.read(key: _kPassword);
  }

  Future<String?> getActiveAccount() async {
    return _flutterSecureStorage.read(key: _kActive);
  }

  Future<void> savePassWord(String passWord) async {
    await _flutterSecureStorage.write(key: _kPassword, value: passWord);
  }

  Future<String?> getCredential() async {
    String? userName = await getUserName();
    if (userName == null) {
      return null;
    }
    String? passWord = await getPassWord();
    if (passWord == null) {
      return null;
    }
    String credentials = '$userName:$passWord';
    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    return stringToBase64Url.encode(credentials);
  }

  // endregion

  Future<void> deleteAll() async {
    await _flutterSecureStorage.deleteAll();
  }
}
