// Created by Jospin MAMBOU on 15/12/2022, 10:15
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 03/11/2022, 20:12

import 'package:sqlbrite/sqlbrite.dart';

import '../../../../shared/service/local/db.dart';
import '../model/authentication_db.dart';
import '../model/contact_db.dart';

class AuthenticationDBA {
  /// [authenticationDb]
  AuthenticationDBA({required this.authenticationDb});

  static const data = 'authentication';

  static const id = 'id';
  static const pin = 'pin';
  static const device = 'device';
  static const code = 'code';
  static const contact = 'contact';

  static const tableSql = '''
      CREATE TABLE IF NOT EXISTS $data (
        $id	INTEGER,
        $pin	INTEGER, 
        $code	INTEGER, 
        $device	TEXT, 
        $contact	INTEGER NOT NULL,
        PRIMARY KEY($id AUTOINCREMENT)
      );
  ''';
  static const dropTableSql = '''
        DROP TABLE IF EXISTS $data;
  ''';

  /// instance de [authenticationDb]
  AuthenticationDb authenticationDb;

  final _db = Db.instance.streamDatabase();

  /// Check database is open
  Future<BriteDatabase> init() async {
    final db = await _db;
    if (!db.isOpen) {
      throw Exception('unknown_database');
    }
    return db;
  }

  /// Check if country is not duplicate
  Future<bool> _isDuplication() async {
    return (await (await init()).query(
      data,
      where: '$code = ? AND $contact = ?',
      whereArgs: [
        authenticationDb.contact?.id,
      ],
    ))
        .isNotEmpty;
  }

  /// To Json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      id: authenticationDb.id,
      code: authenticationDb.code,
      contact: authenticationDb.contact?.id,
      device: authenticationDb.device,
      pin: authenticationDb.pin,
    };
  }

  ///
  Future<AuthenticationDb> toObject(Map<String, dynamic> json) async {
    return AuthenticationDb(
      id: json[id] as int?,
      device: json[device] as String?,
      pin: json[pin] as int?,
      code: json[code] as int?,
      contact: json[contact] != null
          ? await ContactDb.search(json[contact] as int)
          : null,
    );
  }

  ///
  Future<AuthenticationDb?> save() async {
    if (authenticationDb.id == null) {
      if (await _isDuplication()) {
        throw Exception('duplicate_authenticationDbModel');
      }

      return get(await (await init()).insert(data, toJson()));
    }
    if (await (await init()).update(
          data,
          toJson(),
          where: '$id =  ?',
          whereArgs: [authenticationDb.id],
        ) >=
        0) {
      return get(authenticationDb.id);
    }
    return null;
    // return null;
  }

  ///
  Future<AuthenticationDb?> get(int? idL) async {
    final authenticationDbModels =
        await (await init()).query(data, where: '$id =  ?', whereArgs: [idL]);
    return authenticationDbModels.isEmpty
        ? null
        : toObject(authenticationDbModels.first);
  }

  Future<AuthenticationDb?> getFirst() async {
    final authenticationDbModels = await (await init()).query(data);
    return authenticationDbModels.isEmpty
        ? null
        : toObject(authenticationDbModels.first);
  }

  ///
  Future<AuthenticationDb?> search(int contact) async {
    final authenticationDbModels =
        await (await init()).query(data, where: '$code = ?', whereArgs: [code]);
    return authenticationDbModels.isEmpty
        ? null
        : toObject(authenticationDbModels.first);
  }

  Future<int> deleteAll() async {
    return await (await init()).delete(data);
  }
}
