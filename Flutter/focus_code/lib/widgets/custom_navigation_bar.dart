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
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      height: 65,
      selectedIndex: uiProvider.currentIndex,
      onDestinationSelected: ( int index ) => uiProvider.currentIndex = index,
      destinations: const [
        NavigationDestination(
          icon: Icon( Icons.map_outlined ),
          label: 'Mapas',
        ),
        NavigationDestination(
          icon: Icon( Icons.web_outlined ),
          selectedIcon: Icon( Icons.web ), 
          label: 'Web',
        ),
      ],
    );
  }
}