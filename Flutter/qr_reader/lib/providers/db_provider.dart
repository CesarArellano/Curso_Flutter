import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/scan_model.dart';

class DBProvider {
  static Database? _database ;
  static final DBProvider db = DBProvider._();

  DBProvider._(); // Constructor privado, para obtener la misma instancia de mi objeto de la BD.
  
  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await initDB();
    
    return _database!;
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
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          );
        ''');
      }
    ); 
  }
  

  Future<int> newScan(ScanModel newScan) async {
    // Verificar la BD
    final db = await database;
    // Genera un registro en la BD.
    final res = await db.insert('Scans', newScan.toJson());

    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
    ? ScanModel.fromJson(res.first) // Obtiene el mapa obtenido del query.
    : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
    ? res.map((s) => ScanModel.fromJson(s)).toList() // Obtiene el mapa obtenido del query.
    : [];
  }

  Future<List<ScanModel>> getScansByType( String tipo ) async {

    final db  = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'    
    ''');

    return res.isNotEmpty
          ? res.map( (s) => ScanModel.fromJson(s) ).toList()
          : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    // Verificar la BD
    final db = await database;
    // Genera un registro en la BD.
    final res = await db.update('Scans', newScan.toJson(), where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
  }

}

/* Manera complicada de hacer las inserciones.
  Future<int> newScanRaw(ScanModel newScan) async {
    
    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;
    // Verificar la BD
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans( id, tipo, valor )
        VALUES( $id, '$tipo', '$valor' )
    ''');

    return res;
  }
  */