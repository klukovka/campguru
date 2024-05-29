import 'package:components/src/maps/map_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RouteMap extends StatelessWidget {
  final MapController controller;
  final bool isGeopositionEnabled;
  final LatLng mapCurrentPosition;
  final List<LatLng> locations;
  final List<LatLng> polyline;
  final LatLngBounds bounds;
  final TileProvider? tileProvider;

  const RouteMap({
    super.key,
    required this.controller,
    required this.isGeopositionEnabled,
    required this.mapCurrentPosition,
    required this.locations,
    required this.polyline,
    required this.bounds,
    this.tileProvider,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: bounds.center,
        initialCameraFit: CameraFit.bounds(bounds: bounds),
      ),
      children: [
        TileLayer(
          userAgentPackageName: 'com.example.campguru',
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          tileProvider: tileProvider,
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: polyline,
              strokeWidth: 5,
              strokeJoin: StrokeJoin.round,
              color: Colors.black,
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            ...locations.map(
              (e) => Marker(
                point: e,
                rotate: false,
                child: Icon(
                  Theme.of(context).extension<MapThemeData>()?.mapMarker,
                  size: 32,
                  color: Colors.red,
                ),
              ),
            ),
            if (isGeopositionEnabled)
              Marker(
                point: mapCurrentPosition,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Theme.of(context).extension<MapThemeData>()?.humanMarker,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
