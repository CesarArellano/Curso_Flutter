import 'package:flutter/material.dart';
import 'package:focus_code/helpers/helpers.dart';

import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:focus_code/providers/ui_provider.dart';
import 'package:focus_code/providers/db_provider.dart';
import 'package:focus_code/providers/scan_history_provider.dart';
import 'package:focus_code/theme/app_theme.dart';
import 'package:focus_code/widgets/widgets.dart';


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
    final currentTheme = Provider.of<UiProvider>(context).appThemeData;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: scans.length,
      itemBuilder: ( _, i ) => Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: ( DismissDirection direction ) {
          Provider.of<ScanHistoryProvider>(context, listen: false)
            .deleteScanById( scans[i].id! );
        },
        background: Container(
          padding: const EdgeInsets.only( right: 10 ),
          child: const Icon( Icons.delete_outline_rounded, color: Colors.white ),
          color: Colors.red[400],
          alignment: Alignment.centerRight,
        ),
        child: ListTile(
          leading: Icon(
            scanType == 'http'
              ? Icons.web_sharp
              : Icons.map,
            color: (currentTheme == AppTheme.lightTheme) 
              ? AppTheme.primaryColor
              : Colors.white
          ),
          title: Text(scans[i].scanValue),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => scans[i].launchCodeUrl(context),
          onLongPress: () => _showModal( context, scans[i].scanValue )
        ),
      )
    );
  }

  void _showModal(BuildContext context, String codeValue) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)
        )
      ),
      context: context,
      builder: ( _ ) => _ModalContent( codeValue: codeValue )
    );
  }
}

class _ModalContent extends StatelessWidget {
  
  final String codeValue;
  final ScreenshotController _screenshotController = ScreenshotController();
  
  _ModalContent({
    Key? key,
    required this.codeValue
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          width: 50,
          child: const Divider(thickness: 4, height: 10)
        ),
        CustomQRImage(
          screenshotController: _screenshotController,
          qrValue: codeValue,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              title: 'Compartir código',
              onPressed: () => takeScreenshot( _screenshotController ),
            ),
            const SizedBox(width: 10),
            CustomButton(
            title: 'Compartir contenido',
            onPressed: () => shareContent( codeValue ),
          ),
          ],
        ),
        const SizedBox(height: 35),
      ],
    );
  }
}