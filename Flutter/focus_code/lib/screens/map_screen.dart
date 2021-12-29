import 'dart:async';

import 'package:flutter/material.dart';
import 'package:focus_code/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
  
class MapScreen extends StatefulWidget {
  
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Completer<GoogleMapController> _mapCompleter = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel currentScan = ModalRoute.of(context)?.settings.arguments as ScanModel;

    final initPosition = CameraPosition(
      target: currentScan.getLatLng(),
      zoom: 17.5
    );

    //Markers
    Set<Marker> markers = <Marker>{};
    markers.add( Marker(
      markerId: MarkerId( currentScan.id.toString() ),
      infoWindow: InfoWindow(
        title: 'Ubicación escaneada',
        snippet: currentScan.scanValue
      ),
      position: currentScan.getLatLng()
    )); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              splashRadius: 22,
              tooltip: 'Ubicación actual',
              icon: const Icon(Icons.location_on),
              onPressed: () async {
                final GoogleMapController controller = await _mapCompleter.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition( target: currentScan.getLatLng(), zoom: 17.5 )
                ));
              },
            ),
          )
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        myLocationButtonEnabled: false,
        initialCameraPosition: initPosition,
        markers: markers,
        onMapCreated: ( GoogleMapController controller) {
          _mapCompleter.complete( controller );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          mapType = ( mapType == MapType.normal ) ? MapType.satellite : MapType.normal;
          setState(() {});
        },
      ),
    );
  }
}