import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({ required this.tipo });

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    
    return (scans.length > 0) 
      ? ScansList(scans: scans, tipo: tipo)
      : EmptyScans(widthDevice: widthDevice);
  }
}

class EmptyScans extends StatelessWidget {
  EmptyScans({ required this.widthDevice });

  final double widthDevice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: SvgPicture.asset('assets/svgs/empty.svg', width: widthDevice * 0.9)
        ),
        Text('No hay scans disponibles', style: TextStyle(fontSize: 18.0),)
      ],
    );
  }
}

class ScansList extends StatelessWidget {
  final List<ScanModel> scans;
  final String tipo;
  
  ScansList({
    required this.scans,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: scans.length,
      itemBuilder: ( _, i ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.redAccent
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen:false)
            .borrarScanPorID(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
            this.tipo == 'http'
            ? Icons.home_outlined
            : Icons.map_outlined,
            color: Theme.of(context).primaryColor
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () {
            launchURL(context, scans[i]);
          }
        ),
      )
    );
  }
}