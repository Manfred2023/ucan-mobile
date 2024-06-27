// Created by Manfred MOUKATE on 6/25/24, 8:33 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:33 PM
import 'package:sqlbrite/sqlbrite.dart';

import '../../../../shared/service/local/db.dart';
import '../model/motif_db.dart';

class MotifDBA {
  /// [motifDb]
  MotifDBA({required this.motifDb});

  static const data = 'motif';

  static const id = 'id';
  static const code = 'code';
  static const name = 'name';

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
  MotifDb motifDb;

  /// Check if country is not duplicate
  Future<bool> _isDuplication() async {
    return (await (await _init())
            .query(data, where: '$name =  ?', whereArgs: [motifDb.name]))
        .isNotEmpty;
  }

  ///
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      id: motifDb.id,
      code: motifDb.code,
      name: motifDb.name,
    };
  }

  ///
  MotifDb toObject(Map<String, dynamic> json) {
    print(json);
    return MotifDb(
      id: json[id] as int?,
      code: json[code] as int,
      name: json[name] as String,
    );
  }

  ///
  Future<MotifDb?> save() async {
    if (motifDb.id == null) {
      if (await _isDuplication()) {
        final countryL = (await (await _init())
                .query(data, where: '$code =  ?', whereArgs: [motifDb.code]))
            .first;
        return toObject(countryL);
      }
      return get(await (await _init()).insert(data, toJson()));
    }
    if (await (await _init()).update(
          data,
          toJson(),
          where: '$id = ?',
          whereArgs: [motifDb.id],
        ) >=
        0) {
      return get(motifDb.id);
    }
    return null;
  }

  ///
  Future<MotifDb?> get(int? idL) async {
    final motifs =
        await (await _init()).query(data, where: '$id =  ?', whereArgs: [idL]);
    return motifs.isEmpty ? null : toObject(motifs.first);
  }

  Future<MotifDb?> searchCode(int? codeL) async {
    final motifs = await (await _init())
        .query(data, where: '$code =  ?', whereArgs: [codeL]);
    return motifs.isEmpty ? null : toObject(motifs.first);
  }

  Future<List<MotifDb>> getAll() async {
    final motifs = await (await _init()).query(data);

    if (motifs.isNotEmpty) {
      final motifsTab = <MotifDb>[];
      for (final i in motifs) {
        motifsTab.add(await toObject(i));
      }

      return motifsTab;
    }
    return [];
  }

  ///
  Future<MotifDb?> search(String? nameL) async {
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
