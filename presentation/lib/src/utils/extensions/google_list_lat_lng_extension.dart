import 'package:google_maps_flutter/google_maps_flutter.dart';

extension GoogleListLatLngExtension on List<LatLng> {
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

  LatLng get southwest => LatLng(
        smallestLatitude,
        smallestLongitude,
      );

  LatLng get northeast => LatLng(
        biggestLatitude,
        biggestLongitude,
      );

  LatLng get northwest => LatLng(
        biggestLatitude,
        smallestLongitude,
      );

  LatLng get southeast => LatLng(
        smallestLatitude,
        biggestLongitude,
      );

  LatLngBounds getBounds() {
    const safeCoefficient = 0.004;

    return LatLngBounds(
      southwest: LatLng(
        smallestLatitude - safeCoefficient,
        smallestLongitude - safeCoefficient,
      ),
      northeast: LatLng(
        biggestLatitude + safeCoefficient,
        biggestLongitude + safeCoefficient,
      ),
    );
  }
}
