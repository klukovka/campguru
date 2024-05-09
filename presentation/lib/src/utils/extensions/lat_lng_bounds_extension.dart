import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presentation/src/utils/extensions/google_lat_lng_extension.dart';

extension LatLngBoundsExtension on LatLngBounds {
  LatLng get northwest => LatLng(
        northeast.latitude,
        southwest.longitude,
      );

  LatLng get southeast => LatLng(
        southwest.latitude,
        northeast.longitude,
      );

  double get latitudeDiff => northeast.latitude - southwest.latitude;
  double get longitudeDiff => northeast.longitude - southwest.longitude;

  LatLngBounds getShiftedLat(double shift) => LatLngBounds(
        southwest: southwest.getShiftedLat(shift),
        northeast: northeast.getShiftedLat(shift),
      );

  LatLngBounds getShiftedLng(double shift) => LatLngBounds(
        southwest: southwest.getShiftedLng(shift),
        northeast: northeast.getShiftedLng(shift),
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