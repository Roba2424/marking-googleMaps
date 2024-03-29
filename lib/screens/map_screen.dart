import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/placo.dart';

class MapScreen extends StatefulWidget {
  final Location? initialLocation;
  final bool isSelecting;
  const MapScreen(
      {this.initialLocation =
          const Location(address: null, latitude: 37.422, longitude: -122.084),
      this.isSelecting = true,
      super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
        actions: [
          IconButton(
              onPressed: _pickedLocation == null
                  ? null
                  : () => Navigator.of(context).pop(_pickedLocation),
              icon: const Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialLocation!.latitude,
                widget.initialLocation!.longitude),
            zoom: 16),
        onTap: widget.isSelecting ? selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedLocation ??
                      LatLng(widget.initialLocation!.latitude,
                          widget.initialLocation!.longitude),
                ),
              },
      ),
    );
  }
}
