import 'package:flutter/material.dart';

import 'package:focus_code/widgets/widgets.dart';
  
class MapHistoryScreen extends StatelessWidget {
  
  const MapHistoryScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const ScanTiles( scanType: 'map' );
  }
}