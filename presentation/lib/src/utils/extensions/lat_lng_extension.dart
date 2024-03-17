import 'package:domain/domain.dart' as domain;
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;

extension DomainListLatLngExtension on List<domain.LatLng> {
  String toRouteParams() =>
      map((latLng) => '${latLng.latitude},${latLng.longitude}').join(';');

  List<google.LatLng> toGoogleParams() =>
      map((latLng) => google.LatLng(latLng.latitude, latLng.longitude))
          .toList();
}

extension StringLatLngExtension on String {
  List<google.LatLng> toGoogleParams() => split(';').map((item) {
        final latLng = item.split(',');
        return google.LatLng(
          double.parse(latLng.first),
          double.parse(latLng.last),
        );
      }).toList();
}
