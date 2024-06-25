// Created by Manfred MOUKATE on 6/25/24, 8:34 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:34 PM

import '../../../model/authentication.dart';
import '../dba/authentication_dba.dart';
import 'contact_db.dart';

class AuthenticationDb {
  /// {@macro AuthenticationDbModel}
  const AuthenticationDb({
    required this.id,
    required this.pin,
    this.device,
    required this.code,
    required this.contact,
  });

  /// empty AuthenticationDbModel
  AuthenticationDb.empty({
    this.id,
    this.pin,
    this.device,
    this.code,
    this.contact,
  });

  final int? id;
  final int? code;
  final int? pin;
  final String? device;

  final ContactDb? contact;

  /// Returns a copy of this Account with the given values updated.
  ///
  /// {@macro AuthenticationDbModel}
  AuthenticationDb copyWith({
    int? id,
    int? pin,
    String? device,
    int? code,
    ContactDb? contact,
  }) =>
      AuthenticationDb(
        id: id ?? this.id,
        code: code ?? this.code,
        contact: contact ?? this.contact,
        device: device ?? this.device,
        pin: pin ?? this.pin,
      );

  Authentication toAuthentication() {
    return Authentication(
      contact: contact?.toContact(),
      code: code,
      device: device,
      pin: pin,
    );
  }

  static Future<AuthenticationDb> fromAuthentication(
      Authentication authentication) async {
    final authenticationDb = await AuthenticationDb.get();
    return AuthenticationDb(
      id: authenticationDb?.id,
      device: authentication.device,
      code: authentication.code,
      pin: authentication.pin,
      contact: authentication.contact != null
          ? await ContactDb.fromContact(authentication.contact!)
          : null,
    );
  }

  @override
  String toString() {
    return 'AuthenticationDb{id: $id,  device: $device, code: $code, contact: $contact}';
  }

  /// save instance of AuthenticationDbModel
  Future<AuthenticationDb?> save() {
    return AuthenticationDBA(authenticationDb: this).save();
  }

  /// save instance of AuthenticationDbModel
  static Future<AuthenticationDb?> search(int id) {
    return AuthenticationDBA(authenticationDb: AuthenticationDb.empty())
        .get(id);
  }

  static Future<AuthenticationDb?> get() {
    return AuthenticationDBA(authenticationDb: AuthenticationDb.empty())
        .getFirst();
  }

  static Future<AuthenticationDb?> searchBySubscriber(int subscriberId) {
    return AuthenticationDBA(authenticationDb: AuthenticationDb.empty())
        .search(subscriberId);
  }

  static Future<int> delete() async {
    await AuthenticationDBA(authenticationDb: AuthenticationDb.empty())
        .deleteAll();
    return ContactDb.delete();
  }

  static Future<bool> exist(int id) async {
    if ((await search(id)) != null) {
      return true;
    } else {
      return false;
    }
  }
}
