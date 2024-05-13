import 'package:latlong2/latlong.dart';

extension StringLatLngExtension on String {
  List<LatLng> toMapParams() => split(';').map((item) {
        final latLng = item.split(',');
        return LatLng(
          double.parse(latLng.first),
          double.parse(latLng.last),
        );
      }).toList();
}
