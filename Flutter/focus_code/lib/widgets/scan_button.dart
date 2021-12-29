import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:focus_code/providers/scan_history_provider.dart';

class ScanButton extends StatelessWidget {
  
  const ScanButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code_scanner),
      onPressed: () async { 
        final codeResp = await FlutterBarcodeScanner.scanBarcode("#673AB7", "Cancelar", true, ScanMode.QR);
        
        if( codeResp == '-1') return;
        
        final newScanModel = await Provider.of<ScanHistoryProvider>(context).newScan(codeResp);    
        newScanModel.launchUrl(context);
        
      },
    );
  }

}