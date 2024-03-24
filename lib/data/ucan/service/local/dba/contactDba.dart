import 'package:sqlbrite/sqlbrite.dart';
import 'package:ucan/data/ucan/service/local/db.dart';

class ContactDBA {
  //ContactDBA({required this.ContactDb});

  static const data = 'contact';

  static const id = 'id';
  static const username = 'username'; 
  static const mobile = 'mobile';
  static const email = 'email';
  static const whatsapp = 'whatsapp';
  static const pin = 'pin'; 

  static const tableSql = '''   
        CREATE TABLE IF NOT EXISTS $data (
	         $id	INTEGER NOT NULL,
           $username	INTEGER DEFAULT NULL,  
	         $username	TEXT DEFAULT NULL,
	         $mobile	TEXT NOT NULL,
	         $email	TEXT NOT NULL DEFAULT `fr`,
	         $whatsapp	TEXT DEFAULT NULL,
	         $pin	TEXT DEFAULT NULL,  
           PRIMARY KEY($id AUTOINCREMENT) 
        );  
  ''';

  static const dropTableSql = '''
        DROP TABLE IF EXISTS $data;
  ''';

  final _db = Db.instance.streamDatabase();

  /// Check database is open
  Future<BriteDatabase> _init() async {
    final db = await _db;
    if (!db.isOpen) {
      throw Exception('unknown_database');
    }
    return db;
  }
}