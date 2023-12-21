import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_pharmacies_2023/models/pharmacie.dart';
import 'package:latlong2/latlong.dart';

class Localisation extends StatelessWidget {
  const Localisation(
      {super.key, required this.longitude, required this.latitude});

  final double longitude;
  final double latitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(latitude, longitude),
            initialZoom: 20.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'flutter_map',
            ),
            MarkerLayer(markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(longitude, latitude),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 45.0,
                ),
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}
