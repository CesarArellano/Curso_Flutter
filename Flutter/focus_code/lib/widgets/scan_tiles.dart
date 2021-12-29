import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_code/providers/db_provider.dart';
import 'package:focus_code/providers/scan_history_provider.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  final String scanType;

  const ScanTiles({
    Key? key,
    required this.scanType 
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final scanListProvider = Provider.of<ScanHistoryProvider>(context);
    final scans = scanListProvider.scanHistory;
    
    return ( scans.isNotEmpty ) 
      ? ScansList(scans: scans, scanType: scanType)
      : EmptyScans(widthDevice: widthDevice);
  }
}

class EmptyScans extends StatelessWidget {
  const EmptyScans({
    Key? key,
    required this.widthDevice
  }) : super(key: key);

  final double widthDevice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: SvgPicture.asset('assets/svgs/empty.svg', width: widthDevice * 0.9)
        ),
        const Text('No hay scans disponibles', style: TextStyle(fontSize: 18.0),)
      ],
    );
  }
}

class ScansList extends StatelessWidget {
  final List<ScanModel> scans;
  final String scanType;
  
  const ScansList({
    Key? key, 
    required this.scans,
    required this.scanType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: scans.length,
      itemBuilder: ( _, i ) => ListTile(
        leading: Icon(
          scanType == 'http'
          ? Icons.home_outlined
          : Icons.map_outlined,
          color: Theme.of(context).primaryColor
        ),
        title: Text(scans[i].scanValue),
        subtitle: Text(scans[i].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () {
          // launchURL(context, scans[i]);
        }
      )
    );
  }
}