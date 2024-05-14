import 'package:domain/domain.dart' as domain;
import 'package:latlong2/latlong.dart' as flutter_map;

extension DomainLatLngExtension on domain.LatLng {
  flutter_map.LatLng toMapParams() => flutter_map.LatLng(latitude, longitude);
}
