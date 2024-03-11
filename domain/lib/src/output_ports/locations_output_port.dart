import 'package:domain/domain.dart';

abstract class LocationsOutputPort {
  void setAllLocationsFilter(Filter filter);
  void updateAllLocations(List<Location> locations, int amount);
  void stopAllLocationsLoading();
}
