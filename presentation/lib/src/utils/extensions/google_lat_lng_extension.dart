import 'package:latlong2/latlong.dart';

extension LatLng2Extension on LatLng {
  LatLng getShiftedLat(double shift) => LatLng(latitude + shift, longitude);
  LatLng getShiftedLng(double shift) => LatLng(latitude, longitude + shift);
}
