import 'package:google_maps_flutter/google_maps_flutter.dart';

extension StringLatLngExtension on String {
  List<LatLng> toGoogleParams() => split(';').map((item) {
        final latLng = item.split(',');
        return LatLng(
          double.parse(latLng.first),
          double.parse(latLng.last),
        );
      }).toList();
}
