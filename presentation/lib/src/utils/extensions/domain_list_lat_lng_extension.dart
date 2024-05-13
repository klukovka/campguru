import 'package:domain/domain.dart' as domain;
import 'package:latlong2/latlong.dart' as flutter_map;

extension DomainListLatLngExtension on List<domain.LatLng> {
  String toRouteParams() =>
      map((latLng) => '${latLng.latitude},${latLng.longitude}').join(';');

  List<flutter_map.LatLng> toGoogleParams() =>
      map((latLng) => flutter_map.LatLng(latLng.latitude, latLng.longitude))
          .toList();
}
