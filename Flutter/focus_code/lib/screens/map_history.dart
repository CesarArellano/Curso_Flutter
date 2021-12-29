import 'package:flutter/material.dart';
import 'package:focus_code/providers/scan_history_provider.dart';
import 'package:focus_code/theme/app_theme.dart';
import 'package:provider/provider.dart';
  
class MapHistoryScreen extends StatelessWidget {
  
  const MapHistoryScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final scanHistoryProvider = Provider.of<ScanHistoryProvider>(context);
    final scanList = scanHistoryProvider.scanHistory;

    if( scanList.isEmpty ) {
      return const Center(
        child: CircularProgressIndicator.adaptive( backgroundColor: Colors.deepPurple )
      );
    }
    
    return ListView.builder(
      itemCount: scanList.length,
      itemBuilder: ( _, int i) => ListTile(
        leading: Icon( Icons.map, color: AppTheme.primaryColor.shade400 ),
        title: Text( scanList[i].scanValue ),
        trailing: const Icon( Icons.chevron_right ),
        onTap: () {},
      )
    );
  }
}