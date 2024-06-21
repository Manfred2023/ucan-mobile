// Created by Jospin MAMBOU on 15/12/2022, 10:15
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 02/12/2022, 08:43

import 'package:sqlbrite/sqlbrite.dart';

import '../../../../shared/service/local/db.dart';
import '../model/country_db.dart';

class CountryDBA {
  /// [country]
  CountryDBA({required this.country});

  static const data = 'tpcountry';

  static const id = 'id';
  static const code = 'code';
  static const alpha1 = 'alpha1';
  static const alpha2 = 'alpha2';
  static const dialcode = 'dialcode';
  static const namefr = 'namefr';
  static const nameen = 'nameen';

  static const tableSql = '''
        CREATE TABLE IF NOT EXISTS $data (
	         $id	INTEGER,
           $code	INTEGER NOT NULL,
           $alpha1 TEXT,
           $alpha2	TEXT,
           $dialcode	INTEGER NOT NULL,
           $namefr	TEXT NOT NULL UNIQUE,
           $nameen	TEXT NOT NULL UNIQUE,
          PRIMARY KEY($id AUTOINCREMENT)
        );
  ''';

  static const dropTableSql = '''
        DROP TABLE IF EXISTS $data;
  ''';

  final _db = Db.instance;

  /// Check database is open
  Future<BriteDatabase> _init() async {
    if (!(await _db.database).isOpen) await _db.database;
    final db = await _db.streamDatabase();
    if (!db.isOpen) {
      throw Exception('unknown_database');
    }
    return db;
  }

  /// instance de [CountryDb]
  CountryDb country;

  /// Check if country is not duplicate
  Future<bool> _isDuplication() async {
    return (await (await _init())
            .query(data, where: '$code =  ?', whereArgs: [country.code]))
        .isNotEmpty;
  }

  ///
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      id: country.id,
      code: country.code,
      nameen: country.nameen,
      namefr: country.namefr,
      dialcode: country.dialcode,
      alpha1: country.alpha1,
      alpha2: country.alpha2
    };
  }

  ///
  CountryDb toObject(Map<String, dynamic> json) => CountryDb(
        id: json[id] as int?,
        code: json[code] as int,
        nameen: json[nameen] as String,
        namefr: json[namefr] as String,
        dialcode: json[dialcode] as int,
        alpha1: json[alpha1] as String,
        alpha2: json[alpha2] as String,
      );

  ///
  Future<CountryDb?> save() async {
    if (country.id == null) {
      if (await _isDuplication()) {
        final countryL = (await (await _init())
                .query(data, where: '$code =  ?', whereArgs: [country.code]))
            .first;
        return toObject(countryL);
      }
      return get(await (await _init()).insert(data, toJson()));
    }
    if (await (await _init()).update(
          data,
          toJson(),
          where: '$id = ?',
          whereArgs: [country.id],
        ) >=
        0) {
      return get(country.id);
    }
    return null;
  }

  ///
  Future<CountryDb?> get(int? idL) async {
    final countries =
        await (await _init()).query(data, where: '$id =  ?', whereArgs: [idL]);
    return countries.isEmpty ? null : toObject(countries.first);
  }

  ///
  Future<CountryDb?> search(String? alpha) async {
    final countries = await (await _init()).query(
      data,
      where: '$alpha1 LIKE ? OR $alpha2 LIKE ? ',
      whereArgs: [alpha, alpha],
    );
    return countries.isEmpty ? null : toObject(countries.first);
  }

  Future<int> deleteAll() async {
    return await (await _init()).delete(data);
  }
}
