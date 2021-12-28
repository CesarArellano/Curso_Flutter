import 'package:flutter/material.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only( right: 4 ),
            child: IconButton(
              splashRadius: 22,
              icon: const Icon( Icons.delete_forever ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const _HomeScreenBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

    switch( currentIndex ) {
      case 0:
        return const MapHistoryScreen();
      case 1:
        return const WebHistoryScreen();
      default:
        return const MapHistoryScreen();
    }
  }
}