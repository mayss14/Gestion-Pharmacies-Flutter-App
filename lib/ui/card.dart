import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_pharmacies_2023/models/pharmacie.dart';
import 'package:flutter_pharmacies_2023/ui/detail.dart';
import 'package:latlong2/latlong.dart';

class Card0 extends StatelessWidget {
  Card0({super.key, required this.pharmacies});

  final List pharmacies;

  final List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < pharmacies.length; i++) {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(pharmacies[i].latitude, pharmacies[i].longitude),
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.red,
            iconSize: 45.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPhar(pharmacie: pharmacies[i]),
                ),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(48.7884516, 2.2303822),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'flutter_map',
              ),
              MarkerLayer(markers: markers)
            ],
          )
        ],
      ),
    );
  }
}
