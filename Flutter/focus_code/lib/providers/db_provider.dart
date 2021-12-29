import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:focus_code/models/scan_model.dart';
export 'package:focus_code/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  
  static final DBProvider db = DBProvider._(); // Constructor Privado
  DBProvider._();

  Future<Database?> get database async {
    if( _database != null ) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // Path para almacenar la BD.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );

    // Crear database
    return await openDatabase(
      path,
      version: 1, // Si necesitamos nuevas relaciones, tablas, estructuras aumentar en 1.
      onOpen: ( db ) {},
      onCreate: ( Database db, int version ) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            scan_type TEXT,
            scan_value TEXT
          );
        ''');
      } 
    );
  }

  // newScanRaw( ScanModel newScan ) async {
  //   final id = newScan.id;
  //   final scanType = newScan.scanType;
  //   final scanValue = newScan.scanValue;
    
  //   final db = await database;
  //   final resp = await db?.rawInsert('''
  //     INSERT INTO Scans( id, scan_type, scan_value )
  //       VALUES( $id, $scanType, $scanValue )
  //   ''');

  //   return resp;
  // }
  
  Future<int> newScan( ScanModel newScan ) async {
    final db = await database;
    final resp = await db!.insert('Scans', newScan.toJson()); // Último ID registrado
    return resp;
  }
  
  // Future<ScanModel?> getScanById(int id) async {
  //   final db = await database;
  //   final resp = await db?.query('Scans', where: 'id = ?', whereArgs: [ id ]);
  //   return resp!.isNotEmpty
  //     ? ScanModel.fromJson(resp.first)
  //     : null;
  // }

  Future<List<ScanModel>?> getAllScans(int id) async {
    final db = await database;
    final resp = await db!.query('Scans');
    return resp.isNotEmpty
      ? resp.map((s) => ScanModel.fromJson( s) ).toList()
      : null;
  }

  Future<List<ScanModel>?> getScanByType(String type) async {
    final db = await database;
    final resp = await db!.rawQuery('''
      SELECT * FROM Scans WHERE scan_type = '$type'
    ''');
    return resp.isNotEmpty
      ? resp.map((s) => ScanModel.fromJson( s) ).toList()
      : null;
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final resp = await db!.update('Scans', newScan.toJson(), where: 'id = ?', whereArgs: [ newScan.id ]);
    return resp;
  }

  // Eliminar registros
  Future<int> deleteScan( int id ) async {

    final db  = await database;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db  = await database;
    final res = await db!.rawDelete('DELETE FROM Scans');
    return res;
  }

}