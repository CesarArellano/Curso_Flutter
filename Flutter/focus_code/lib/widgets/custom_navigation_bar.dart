import 'package:flutter/material.dart';
import 'package:focus_code/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    return NavigationBar(
      animationDuration: const Duration( milliseconds: 700 ),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: uiProvider.currentIndex,
      onDestinationSelected: ( int index ) => uiProvider.currentIndex = index,
      destinations: const [
        NavigationDestination(
          icon: Icon( Icons.map_outlined ),
          selectedIcon: Icon( Icons.map ), 
          label: 'Mapas',
        ),
        NavigationDestination(
          icon: Icon( Icons.web_asset ),
          selectedIcon: Icon( Icons.web_rounded ), 
          label: 'Web',
        ),
        NavigationDestination(
          icon: Icon( Icons.qr_code ),
          selectedIcon: Icon( Icons.qr_code_sharp ), 
          label: 'Generador',
        ),
        NavigationDestination(
          icon: Icon( Icons.settings_outlined ),
          selectedIcon: Icon( Icons.settings), 
          label: 'Ajustes',
        ),
      ],
    );
  }
}