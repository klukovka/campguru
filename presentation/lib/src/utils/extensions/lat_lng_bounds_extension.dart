import 'package:google_maps_flutter/google_maps_flutter.dart';

extension LatLngBoundsExtension on LatLngBounds {
  LatLng get northwest => LatLng(
        northeast.latitude,
        southwest.longitude,
      );

  LatLng get southeast => LatLng(
        southwest.latitude,
        northeast.longitude,
      );
}
