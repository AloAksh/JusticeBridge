import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;
  late List<Marker> markers = [];

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _loadPrisonerCoordinates();
  }

  Future<void> _loadPrisonerCoordinates() async {
    final String csvString = await rootBundle.loadString('assets/prisoner_coordinates.csv');
    List<List<dynamic>> csvData = const CsvToListConverter().convert(csvString);

    setState(() {
      markers = csvData.map((row) {
        String name = row[0];
        double latitude = double.parse(row[1].toString());
        double longitude = double.parse(row[2].toString());
        return Marker(
          markerId: MarkerId(name),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(title: name),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prisoner Tracking'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0), // Initial map center
          zoom: 2, // Initial zoom level
        ),
        markers: Set.from(markers),
      ),
    );
  }
}
