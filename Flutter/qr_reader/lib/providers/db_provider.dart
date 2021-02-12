import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._(); // Constructor privado, para obtener la misma instancia de mi objeto de la BD.
  
  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    
    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');  //Construir url con extensión .db
    print(path);
    
    // Crear base de datos, es necesario incrementar la versión cada vez que necesitemos crear la BD.
    return await openDatabase(
      path, 
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY_KEY,
            tipo TEXT,
            valor TEXT
          );
        ''');
      }
    ); 
  }
}