import 'package:domain/domain.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorGeopositionRepository implements GeopositionRepository {
  @override
  Future<FailureOrResult<void>> checkServiceEnabled() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return FailureOrResult.failure(ApplicationFailure(
        type: ApplicationErrorType.geolocatorServiceDisabled,
      ));
    }
    return FailureOrResult.success(null);
  }

  @override
  Future<FailureOrResult<void>> checkPermissions() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return FailureOrResult.failure(ApplicationFailure(
          type: ApplicationErrorType.permissionDenied,
        ));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return FailureOrResult.failure(ApplicationFailure(
        type: ApplicationErrorType.permissionDeniedForever,
      ));
    }

    return FailureOrResult.success(null);
  }

  @override
  FailureOrResult<Stream<LatLng>> getCurrentPositionStream() {
    try {
      final positions = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      return FailureOrResult.success(
        positions.map(
          (position) => LatLng(position.latitude, position.longitude),
        ),
      );
    } catch (e) {
      return FailureOrResult.failure(ApplicationFailure(
        type: ApplicationErrorType.general,
        message: e.toString(),
      ));
    }
  }
}
