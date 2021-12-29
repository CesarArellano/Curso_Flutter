import 'package:flutter/material.dart';

import 'package:focus_code/widgets/widgets.dart';
  
class WebHistoryScreen extends StatelessWidget {
  
  const WebHistoryScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const ScanTiles( scanType: 'http' );
  }
}
