// Created by Jospin MAMBOU on 15/12/2022, 10:15
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 10/11/2022, 09:13

import 'package:sqlbrite/sqlbrite.dart';

import '../../../../shared/service/local/db.dart';
import '../models/cities_db.dart';

///
class CitiesDBA {
  /// [city]
  CitiesDBA({required this.city});

  static const data = 'tpcitylist';

  static const id = 'id';
  static const name = 'name';
  static const code = 'code';

  static const tableSql = '''
       CREATE TABLE IF NOT EXISTS $data (
	        $id	INTEGER,
	        $name	TEXT NOT NULL,
	        $code	TEXT NOT NULL, 
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
  CitiesDb city;

  /// Check if country is not duplicate
  Future<bool> _isDuplication() async {
    return (await (await init()).query(
      data,
      where: '$code LIKE ?',
      whereArgs: [city.code],
    ))
        .isNotEmpty;
  }

  ///
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      id: city.id,
      name: city.name,
      code: city.code,
    };
  }

  ///
  Future<CitiesDb> toObject(Map<String, dynamic> json) async {
    return CitiesDb(
      id: json[id] as int?,
      name: json[name] as String,
      code: json[code] as String,
    );
  }

  ///
  Future<CitiesDb?> save() async {
    if (city.id == null) {
      if (await _isDuplication()) {
        final cityL = (await (await init()).query(
          data,
          where: '$code LIKE ? ',
          whereArgs: [
            city.code,
          ],
        ))
            .first;
        return toObject(cityL);
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
  Future<CitiesDb?> get(int? idL) async {
    final cities =
        await (await init()).query(data, where: '$id =  ?', whereArgs: [idL]);
    return cities.isEmpty ? null : toObject(cities.first);
  }

  Future<List<CitiesDb>?> getAll() async {
    final cities =
        await (await init()).query(data, orderBy: 'UPPER($name) ASC');
    if (cities.isNotEmpty) {
      final citiess = <CitiesDb>[];
      for (final i in cities) {
        citiess.add(await toObject(i));
      }
      return citiess;
    }
    return null;
  }

  ///
  Future<CitiesDb?> search(String code) async {
    final cities = await (await init()).query(
      data,
      where: '${CitiesDBA.code} LIKE ? ',
      whereArgs: [code],
    );
    return cities.isEmpty ? null : toObject(cities.first);
  }

  Future<int> deleteAll() async {
    return await (await init()).delete(data);
  }
}
