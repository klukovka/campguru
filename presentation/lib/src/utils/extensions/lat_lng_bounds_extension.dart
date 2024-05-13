import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:presentation/src/utils/extensions/google_lat_lng_extension.dart';

extension LatLngBoundsExtension on LatLngBounds {
  LatLng get northwest => LatLng(
        northEast.latitude,
        southWest.longitude,
      );

  LatLng get southeast => LatLng(
        southWest.latitude,
        northEast.longitude,
      );

  double get latitudeDiff => northEast.latitude - southWest.latitude;
  double get longitudeDiff => northEast.longitude - southWest.longitude;

  LatLngBounds getShiftedLat(double shift) => LatLngBounds(
        southWest.getShiftedLat(shift),
        northEast.getShiftedLat(shift),
      );

  LatLngBounds getShiftedLng(double shift) => LatLngBounds(
        southWest.getShiftedLng(shift),
        northEast.getShiftedLng(shift),
      );

  List<List<LatLngBounds>> splitBounds(LatLngBounds initialBounds) {
    final height = (latitudeDiff / initialBounds.latitudeDiff).ceil();
    final width = (longitudeDiff / initialBounds.longitudeDiff).ceil();

    return List.generate(
      height,
      (i) {
        return List.generate(width, (j) {
          return initialBounds
              .getShiftedLng(j * longitudeDiff)
              .getShiftedLat(-i * latitudeDiff);
        });
      },
    );
  }
}
