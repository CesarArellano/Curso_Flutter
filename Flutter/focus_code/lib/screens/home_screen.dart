import 'package:flutter/material.dart';

import 'package:focus_code/providers/scan_history_provider.dart';
import 'package:focus_code/providers/ui_provider.dart';

import 'package:focus_code/screens/screens.dart';
import 'package:focus_code/widgets/widgets.dart';
import 'package:provider/provider.dart';
  
class HomeScreen extends StatelessWidget {
  
  final List<String> appBarTitles = ['Historial Mapas', 'Historial Web', 'Generador QR', 'Ajustes'];
  
  HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<UiProvider>(context).currentIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text( appBarTitles[currentIndex] ),
        centerTitle: true,
        actions: [
          Visibility(
            visible: (currentIndex == 0 || currentIndex == 1) && Provider.of<ScanHistoryProvider>(context).scanHistory.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only( right: 4 ),
              child: IconButton(
                tooltip: 'Borrar todo',
                splashRadius: 22,
                icon: const Icon( Icons.delete_forever ),
                onPressed: () {
                  Provider.of<ScanHistoryProvider>(context, listen: false)
                    .deleteAllScans();
                },
              ),
            ),
          ),
        ],
      ),
      body: const _HomeScreenBody(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const ScanButton(),
      bottomNavigationBar: const CustomNavigationBar()
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentIndex = Provider.of<UiProvider>(context).currentIndex;
    final scanHistoryProvider = Provider.of<ScanHistoryProvider>(context, listen: false);

    // scanHistoryProvider.newScan('https://google.com.mx');
    // scanHistoryProvider.newScan('geo:19.673361, -98.978361');

    switch( currentIndex ) {
      case 0:
        scanHistoryProvider.loadScansByType('geo');
        return const MapHistoryScreen();
      case 1:
        scanHistoryProvider.loadScansByType('http');
        return const WebHistoryScreen();
      case 2:
        return const QrGenerator();
      case 3:
        return const Settings();
      default:
        return const MapHistoryScreen();
    }
  }
}