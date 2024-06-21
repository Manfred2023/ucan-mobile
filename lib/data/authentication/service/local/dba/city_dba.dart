// Created by Jospin MAMBOU on 15/12/2022, 10:15
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 10/11/2022, 09:13

import 'package:sqlbrite/sqlbrite.dart';

import '../../../../shared/service/local/db.dart';
import '../model/city_db.dart';
import '../model/country_db.dart';

///
class CityDBA {
  /// [city]
  CityDBA({required this.city});

  static const data = 'city';

  static const id = 'id';
  static const name = 'name';
  static const code = 'code';
  static const country = 'country';

  static const tableSql = '''
       CREATE TABLE IF NOT EXISTS $data (
	        $id	INTEGER,
	        $name	TEXT NOT NULL,
	        $code	TEXT NOT NULL,
	        $country	INTEGER NOT NULL,
	        PRIMARY KEY($id AUTOINCREMENT)
       );
  ''';

  static const dropTableSql = '''
        DROP TABLE IF EXISTS $data;
  ''';

  final _db = Db.instance.streamDatabase();

  /// Check database is open
  Future<BriteDatabase> init() async {
    final db = await _db;
    if (!db.isOpen) {
      throw Exception('unknown_database');
    }
    return db;
  }

  /// instance de [Country]
  CityDb city;

  /// Check if country is not duplicate
  Future<bool> _isDuplication() async {
    return (await (await init()).query(
      data,
      where: '$name LIKE ? AND $country =  ?',
      whereArgs: [city.name, city.country.id],
    ))
        .isNotEmpty;
  }

  ///
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      id: city.id,
      name: city.name,
      code: city.code,
      country: city.country.id,
    };
  }

  ///
  Future<CityDb> toObject(Map<String, dynamic> json) async {
    return CityDb(
      id: json[id] as int?,
      name: json[name] as String,
      code: json[code] as String?,
      country: (await CountryDb.search(json[country] as int))!,
    );
  }

  ///
  Future<CityDb?> save() async {
    if (city.id == null) {
      if (await _isDuplication()) {
        final cityL = (await (await init()).query(
          data,
          where: '$name LIKE ? AND $country =  ?',
          whereArgs: [city.name, city.country.id],
        ))
            .first;
        return toObject(cityL);
      }
      if (!await CountryDb.exist(city.country.id ?? -1)) {
        throw Exception('country_do_not_in_city');
      }
      return get(await (await init()).insert(data, toJson()));
    }
    if (await (await init())
            .update(data, toJson(), where: '$id = ?', whereArgs: [city.id]) >=
        0) {
      return get(city.id);
    }
    return null;
  }

  ///
  Future<CityDb?> get(int? idL) async {
    final cities =
        await (await init()).query(data, where: '$id =  ?', whereArgs: [idL]);
    return cities.isEmpty ? null : toObject(cities.first);
  }

  ///
  Future<CityDb?> search(String name) async {
    final cities = await (await init()).query(
      data,
      where: '${CityDBA.name} LIKE ? ',
      whereArgs: [name],
    );
    return cities.isEmpty ? null : toObject(cities.first);
  }

  Future<int> deleteAll() async {
    return await (await init()).delete(data);
  }
}
