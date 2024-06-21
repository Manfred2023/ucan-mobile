// Created by Manfred MOUKATE on 6/21/24, 3:32 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/21/24, 3:32 PM

import 'package:sqlbrite/sqlbrite.dart';

import '../../../../shared/service/local/db.dart';
import '../model/city_db.dart';
import '../model/contact_db.dart';

class ContactDBA {
  /// [contact]
  ContactDBA({required this.contact});

  static const data = 'tpcontact';

  static const id = 'id';
  static const gender = 'gender';
  static const token = 'token';

  static const lastname = 'lastname';
  static const firstname = 'firstname';
  static const mobile = 'mobile';
  static const email = 'email';
  static const city = 'city';
  static const location = 'location';

  static const tableSql = '''
      CREATE TABLE IF NOT EXISTS $data (
        $id	INTEGER,
        $token	INTEGER, 
        $lastname	TEXT, 
        
        $gender	TEXT, 
        $firstname	TEXT, 
        $mobile	TEXT,  
        $email	TEXT, 
        $city	INTEGER, 
     
        $location	TEXT, 
        PRIMARY KEY($id AUTOINCREMENT)
      );
  ''';

  static const dropTableSql = '''
        DROP TABLE IF EXISTS $data;
  ''';

  /// instance de [contact]
  ContactDb contact;

  final _db = Db.instance.streamDatabase();

  /// Check database is open
  Future<BriteDatabase> init() async {
    final db = await _db;
    if (!db.isOpen) {
      throw Exception('unknown_database');
    }
    return db;
  }

  /// Check if Subscriber is not duplicate
  Future<bool> _isDuplication() async {
    return (await (await init()).query(
      data,
      where: '$token = ?',
      whereArgs: [contact.token],
    ))
        .isNotEmpty;
  }

  /// To Json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      id: contact.id,
      token: contact.token,
      location: contact.location,
      gender: contact.gender,
      email: contact.email,
      firstname: contact.firstname,
      lastname: contact.lastname,
      mobile: contact.mobile,
      city: contact.city!.id,
    };
  }

  ///
  Future<ContactDb> toObject(Map<String, dynamic> json) async {
    return ContactDb(
      id: json[id] as int?,
      token: json[token] as int?,
      location: json[location] as String?,
      city: (await CityDb.search(json[city] as int))!,
      gender: json[gender] as String?,
      email: json[email] as String?,
      firstname: json[firstname] as String?,
      mobile: json[mobile] as String?,
      lastname: json[lastname] as String?,
    );
  }

  ///
  Future<ContactDb?> save() async {
    if (contact.id == null) {
      return get(await (await init()).insert(data, toJson()));
    }
    if (await (await init()).update(
          data,
          toJson(),
          where: '$id =  ?',
          whereArgs: [contact.id],
        ) >=
        0) {
      return get(contact.id);
    }
    return null;
  }

  ///
  Future<ContactDb?> get(int? idL) async {
    final subscriberDbModels =
        await (await init()).query(data, where: '$id =  ?', whereArgs: [idL]);
    return subscriberDbModels.isEmpty
        ? null
        : toObject(subscriberDbModels.first);
  }

  ///
  Future<ContactDb?> search(String code) async {
    final subscriberDbModels = await (await init()).query(
      data,
      where: '$token LIKE ?',
      whereArgs: [code],
    );
    return subscriberDbModels.isEmpty
        ? null
        : toObject(subscriberDbModels.first);
  }

  Future<int> deleteAll() async {
    return await (await init()).delete(data);
  }
}
