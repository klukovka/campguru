import 'package:domain/domain.dart';

abstract class GeopositionRepository {
  Future<FailureOrResult<void>> checkServiceEnabled();
  Future<FailureOrResult<void>> checkPermissions();
  Future<FailureOrResult<LatLng>> getCurrentPosition();
  FailureOrResult<Stream<LatLng>> getCurrentPositionStream();
}
