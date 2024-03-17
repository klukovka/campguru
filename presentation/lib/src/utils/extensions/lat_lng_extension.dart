import 'package:domain/domain.dart' as domain;
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;

extension DomainListLatLngExtension on List<domain.LatLng> {
  String toRouteParams() =>
      map((latLng) => '${latLng.latitude},${latLng.longitude}').join(';');

  List<google.LatLng> toGoogleParams() =>
      map((latLng) => google.LatLng(latLng.latitude, latLng.longitude))
          .toList();
}

extension GoogleListLatLngExtension on List<google.LatLng> {
  double get westPoint {
    final latitude = map((e) => e.latitude).toList()..sort();
    return latitude.first;
  }

  double get eastPoint {
    final latitude = map((e) => e.latitude).toList()..sort();
    return latitude.last;
  }

  double get southPoint {
    final longitude = map((e) => e.longitude).toList()..sort();
    return longitude.first;
  }

  double get northPoint {
    final longitude = map((e) => e.longitude).toList()..sort();
    return longitude.last;
  }

  google.LatLng get southwest => google.LatLng(
        westPoint,
        southPoint,
      );

  google.LatLng get northeast => google.LatLng(
        eastPoint,
        northPoint,
      );

  google.LatLng get southeast => google.LatLng(
        eastPoint,
        southPoint,
      );

  google.LatLng get northwest => google.LatLng(
        westPoint,
        northPoint,
      );

  google.LatLngBounds getBounds() {
    // const safeCoefficient = 0.004;
    const safeCoefficient = 0.004;

    return google.LatLngBounds(
      southwest: google.LatLng(
        westPoint - safeCoefficient,
        southPoint - safeCoefficient,
      ),
      northeast: google.LatLng(
        eastPoint + safeCoefficient,
        northPoint + safeCoefficient,
      ),
    );
  }
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
