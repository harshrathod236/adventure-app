import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataClass {
  static createData() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      String favDataBase = "CREATE TABLE STOREDATA (id INTEGER PRIMARY KEY AUTOINCREMENT, url TEXT, name TEXT, locationName TEXT, personalId TEXT)";
      await db.execute(favDataBase);
    });
    return database;
  }

  static insertData(Database database, String url, String name, String locationName, String personalId) async {
    String favDataBase = "INSERT INTO STOREDATA(url,name,locationName,personalId)values ('$url','$name','$locationName',$personalId)";
    await database.rawInsert(favDataBase);
  }

  static getData(Database database) async {
    String favDataBase = "SELECT * FROM STOREDATA";
    List<Map> list = await database.rawQuery(favDataBase);
    return list;
  }

  static Future<void> deleteData(Database database, var idSave) async {
    String qry = "delete from STOREDATA where personalId = '$idSave'";
    await database.rawDelete(qry);
  }

  static Future<bool> checkFavourite(Database database, idSave) async {
    String qry = "select * from STOREDATA where personalId = '$idSave'";
    List l = await database.rawQuery(qry);
    bool checkIdRepeated = false;
    if (l.isNotEmpty) {
      checkIdRepeated = true;
    }
    return checkIdRepeated;
  }
}
