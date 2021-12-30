import 'package:flutter/material.dart';

import 'package:focus_code/providers/scan_history_provider.dart';
import 'package:focus_code/providers/ui_provider.dart';

import 'package:focus_code/screens/screens.dart';
import 'package:focus_code/widgets/widgets.dart';
import 'package:provider/provider.dart';
  
class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        centerTitle: true,
        actions: [
          Visibility(
            visible: Provider.of<ScanHistoryProvider>(context).scanHistory.isNotEmpty,
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
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
      default:
        return const MapHistoryScreen();
    }
  }
}