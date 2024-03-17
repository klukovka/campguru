import 'package:google_maps_flutter/google_maps_flutter.dart';

extension GoogleLatLngExtension on LatLng {
  LatLng getShiftedLat(double shift) => LatLng(latitude + shift, longitude);
  LatLng getShiftedLng(double shift) => LatLng(latitude, longitude + shift);
}
