 
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart'; 
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:ucan/data/ucan/service/local/dba/contactDba.dart';
 

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
  static const _databaseVersion = 1;

  ///
  static Lock lock = Lock();

  // only have a single app-wide reference to the database
  Database? _database;

  Future<void> _onCreate(Database db, int version) async {
    try {
      await _createTable(db);
      //Flogger.i('Create DB');
    } catch (e) {
      //Flogger.i('ERROR Create DB $e');
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      try {
        await _dropTable(db);
        await _createTable(db);
        //Flogger.i('UPGRADE DB');
      } catch (e) {
       // Flogger.i('ERROR UPGRADE DB $e');
      }
    }
  }

  Future<void> _createTable(Database db) async {
    await _setting(db);
    await _setup(db);
    await _business(db);
  }

  Future<void> _dropTable(Database db) async {
    //await db.execute(InventoryLineDBA.dropTableSql);
  }

  Future<void> _setting(Database db) async {
    // await db.execute(ServerDBA.tableSql);
    // await db.execute(ConnectionDBA.tableSql);
  }

  Future<void> _setup(Database db) async {
    await db.execute(ContactDBA.tableSql); 
  }

  Future<void> _business(Database db) async {
    await db.execute(ContactDBA.tableSql); 
  }

  Future<void> _addColumn(
    Database db,
    String table,
    String column,
    String type,
  ) async {
    final columns = await db.rawQuery(
      "SELECT sql FROM sqlite_master WHERE type='table' AND name='$table'",
    );
    final result = columns.first['sql'] as String;
    final bool columnExists = result.contains(column);
    if (!columnExists) {
      await db.execute('ALTER TABLE $table ADD COLUMN $column $type;');
    }
  }

  static int guid() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  static Future<List<Map<String, Object?>>?>? findFromString({
    required String table,
    required String field,
    required String value,
  }) async {
    final result = await (await instance.streamDatabase()).query(
      table,
      where: '$field LIKE ?',
      whereArgs: [value],
    );
    return result.isEmpty ? null : result;
  }

  static Future<List<Map<String, Object?>>?>? findFromInt({
    required String table,
    required String field,
    required int value,
  }) async {
    final result = await (await instance.streamDatabase()).query(
      table,
      where: '$field = ?',
      whereArgs: [value],
    );
    return result.isEmpty ? null : result;
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