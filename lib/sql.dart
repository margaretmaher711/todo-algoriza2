import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await intialDB();
      return _database;
    }
    return _database;
  }

  intialDB() async {
    String pathDB = await getDatabasesPath();
    String path = join(pathDB, 'margoo.db');
    Database myDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    print('opeend');
    return myDB;
  }

//we gonna create tabel
  _onCreate(Database db, int version) async {
    print('creating');

    await db.execute('''
          create table Tasks 
          (id integer not null primary key autoincrement
          ,titel text,date text
          ,time text)''').then((value) {
      print('created');
    });
  }

  readDB() async {
    Database? mydata = await database;

    List<Map> readedData = await mydata!.rawQuery('select * from Tasks');
    print(readedData);
    return readedData;
  }

  insertDB(String sql) async {
    Database? mydata = await database;
    int readedData = await mydata!.rawInsert(sql);

    print('insertion dooone');

    return readedData;
  }

  deletDB(String sql) async {
    Database? mydata = await database;
    int readedData = await mydata!.rawDelete(sql);
    return readedData;
  }

  updateDB(String sql) async {
    Database? myDB = await database;
    int readedData = await myDB!.rawUpdate(sql);
    return readedData;
  }
}
