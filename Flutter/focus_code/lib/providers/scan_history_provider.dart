import 'package:flutter/material.dart';
import 'package:focus_code/providers/db_provider.dart';

class ScanHistoryProvider extends ChangeNotifier {

  List<ScanModel> scanHistory = [];
  String selectedType = 'http';

  void newScan( String scanValue ) async {
    final newScan = ScanModel(scanValue: scanValue );
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;
    
    if( selectedType == newScan.scanType ) {
      scanHistory.add(newScan);
      notifyListeners();
    }
  }

  void loadScansByType( String type ) async {
    selectedType = type;
    final resp = await DBProvider.db.getScanByType(type);
    scanHistory = resp ?? [];
    notifyListeners();
  }

  void deleteAllScans() async {
    await DBProvider.db.deleteAll();
    scanHistory = [];
    notifyListeners();
  }

  void deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType( selectedType );
  }
}