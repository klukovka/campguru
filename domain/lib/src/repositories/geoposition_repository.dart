import 'package:domain/domain.dart';

abstract class GeopositionRepository {
  Future<FailureOrResult<void>> checkServiceEnabled();
  Future<FailureOrResult<void>> checkPermissions();
  FailureOrResult<Stream<LatLng>> getCurrentPositionStream();
}
