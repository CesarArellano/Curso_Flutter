import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {

  int? id;
  String? scanType;
  String scanValue;

  ScanModel({
    this.id,
    this.scanType,
    required this.scanValue,
  }) {
    scanType = ( scanValue.contains('http') ) ? 'http' :'geo';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
    id: json["id"],
    scanType: json["scan_type"],
    scanValue: json["scan_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "scan_type": scanType,
    "scan_value": scanValue,
  };

  void launchUrl(BuildContext context) async {
    if( scanType == 'http' ) {
      if ( !await launch(scanValue) ) throw 'Could not launch $scanValue';
    } else {
      Navigator.pushNamed(context, 'map', arguments: this);
    }
  }

  LatLng getLatLng() {
    final coors = scanValue.substring(4).split(',');
    final lat = double.tryParse(coors[0]) ?? 37.43296265331129;
    final lng = double.tryParse(coors[1]) ?? -122.08832357078792;
    return LatLng( lat, lng );
  }
}
