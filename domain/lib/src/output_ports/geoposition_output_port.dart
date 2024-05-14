import 'package:domain/domain.dart';

abstract class GeopositionOutputPort {
  void setGeopositionEnabled(bool enabled);
  void updateUserPosition(LatLng latLng);
}
