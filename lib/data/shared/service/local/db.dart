// Created by Manfred MOUKATE on 6/21/24, 2:51 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/21/24, 2:51 PM

import 'package:logging_flutter/logging_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:ucan/data/account/service/local/dba/motif_dba.dart';

import '../../../authentication/service/local/dba/authentication_dba.dart';
import '../../../authentication/service/local/dba/city_dba.dart';
import '../../../authentication/service/local/dba/contact_dba.dart';
import '../../../authentication/service/local/dba/country_dba.dart';

/// DataBase
class Db {
  // Singleton class
  Db._privateConstructor();

  static late BriteDatabase _streamDatabase;

  ///
  static final Db instance = Db._privateConstructor();

  /// database name
  static const _databaseName = 'ucan.db';

  /// database version
  static const _databaseVersion = 16;

  ///
  static Lock lock = Lock();

  // only have a single app-wide reference to the database
  Database? _database;

  Future _onCreate(Database db, int version) async {
    try {
      await _createTable(db);
      Flogger.i('Create DB');
    } catch (e) {
      Flogger.i('ERROR Create DB $e');
    }
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      try {
        await _dropTable(db);
        await _createTable(db);
        Flogger.i('UPGRADE DB');
      } catch (e) {
        Flogger.i('ERROR UPGRADE DB $e');
      }
    }
  }

  Future _createTable(Database db) async {
    // await db.execute(CitiesDBA.tableSql);
    await db.execute(CountryDBA.tableSql);
    await db.execute(CityDBA.tableSql);
    await db.execute(ContactDBA.tableSql);
    await db.execute(AuthenticationDBA.tableSql);
    await db.execute(MotifDBA.tableSql);
  }

  Future _dropTable(Database db) async {
    await db.execute(CountryDBA.dropTableSql);
    await db.execute(CityDBA.dropTableSql);
  }

  Future<void> _addColumn(
      Database db, String table, String column, String type) async {
    final columns = await db.rawQuery(
        "SELECT sql FROM sqlite_master WHERE type='table' AND name='$table'");
    final result = columns.first['sql'] as String;
    bool columnExists = result.contains(column);
    if (!columnExists) {
      await db.execute('ALTER TABLE $table ADD COLUMN $column $type;');
    }
  }

  /// Database (open)
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    await Sqflite.setDebugModeOn();

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  ///
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Use this object to prevent concurrent access to data

    await lock.synchronized(() async {
      // lazily instantiate the db the first time it is accessed
      if (_database == null) {
        _database = await _initDatabase();
        _streamDatabase = BriteDatabase(_database!);
      }
    });
    return _database!;
  }

  ///
  Future<BriteDatabase> streamDatabase() async {
    await database;
    return _streamDatabase;
  }

  /// Close stream off database
  void close() {
    _streamDatabase.close();
  }
}
