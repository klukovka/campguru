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
  double get smallestLatitude {
    final latitude = map((e) => e.latitude).toList()..sort();
    return latitude.first;
  }

  double get biggestLatitude {
    final latitude = map((e) => e.latitude).toList()..sort();
    return latitude.last;
  }

  double get smallestLongitude {
    final longitude = map((e) => e.longitude).toList()..sort();
    return longitude.first;
  }

  double get biggestLongitude {
    final longitude = map((e) => e.longitude).toList()..sort();
    return longitude.last;
  }

  google.LatLng get southwest => google.LatLng(
        smallestLatitude,
        smallestLongitude,
      );

  google.LatLng get northeast => google.LatLng(
        biggestLatitude,
        biggestLongitude,
      );

  google.LatLng get northwest => google.LatLng(
        biggestLatitude,
        smallestLongitude,
      );

  google.LatLng get southeast => google.LatLng(
        smallestLatitude,
        biggestLongitude,
      );

  google.LatLngBounds getBounds() {
    const safeCoefficient = 0.004;

    return google.LatLngBounds(
      southwest: google.LatLng(
        smallestLatitude - safeCoefficient,
        smallestLongitude - safeCoefficient,
      ),
      northeast: google.LatLng(
        biggestLatitude + safeCoefficient,
        biggestLongitude + safeCoefficient,
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
