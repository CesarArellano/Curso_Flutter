import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:focus_code/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';
  
class ScanButton extends StatelessWidget {
  
  const ScanButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code_scanner),
      onPressed: () async { 
        final codeResp = await FlutterBarcodeScanner.scanBarcode("#673AB7", "Cancelar", true, ScanMode.QR);
        
        if( codeResp == '-1') return;

        final newScan = ScanModel(scanValue: codeResp);
        
        DBProvider.db.newScan(newScan);
        
      },
    );
  }

  void _launchURL( String url ) async {
    if (!await launch( url )) throw 'Could not launch $url';
  }

}