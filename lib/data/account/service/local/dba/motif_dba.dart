// Created by Manfred MOUKATE on 6/25/24, 8:33 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:33 PM
import 'package:sqlbrite/sqlbrite.dart';

import '../../../../shared/service/local/db.dart';
import '../model/motif_db.dart';

class MotifDBA {
  /// [motif]
  MotifDBA({required this.motif});

  static const data = 'motif';

  static const id = 'id';
  static const code = 'code';
  static const name = 'name ';

  static const tableSql = '''
        CREATE TABLE IF NOT EXISTS $data (
	         $id	INTEGER,
           $code	INTEGER NOT NULL,
           $name 	TEXT NOT NULL UNIQUE,
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

  /// instance de [MotifDb]
  MotifDb motif;

  /// Check if country is not duplicate
  Future<bool> _isDuplication() async {
    return (await (await _init())
            .query(data, where: '$code =  ?', whereArgs: [motif.code]))
        .isNotEmpty;
  }

  ///
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      id: motif.id,
      code: motif.code,
      name: motif.name,
    };
  }

  ///
  MotifDb toObject(Map<String, dynamic> json) => MotifDb(
        id: json[id] as int?,
        code: json[code] as int,
        name: json[name] as String,
      );

  ///
  Future<MotifDb?> save() async {
    if (motif.id == null) {
      if (await _isDuplication()) {
        final countryL = (await (await _init())
                .query(data, where: '$code =  ?', whereArgs: [motif.code]))
            .first;
        return toObject(countryL);
      }
      return get(await (await _init()).insert(data, toJson()));
    }
    if (await (await _init()).update(
          data,
          toJson(),
          where: '$id = ?',
          whereArgs: [motif.id],
        ) >=
        0) {
      return get(motif.id);
    }
    return null;
  }

  ///
  Future<MotifDb?> get(int? idL) async {
    final countries =
        await (await _init()).query(data, where: '$id =  ?', whereArgs: [idL]);
    return countries.isEmpty ? null : toObject(countries.first);
  }

  ///
  Future<MotifDb?> search(String? name) async {
    final countries = await (await _init()).query(
      data,
      where: '$name LIKE ?   ',
      whereArgs: [
        name,
      ],
    );
    return countries.isEmpty ? null : toObject(countries.first);
  }

  Future<int> deleteAll() async {
    return await (await _init()).delete(data);
  }
}
