import 'package:domain/domain.dart';

abstract class LocationsOutputPort {
  void setAllLocationsFilter(Filter filter);
  void updateAllLocations(List<Location> locations, int amount);
  void stopAllLocationsLoading();
  void updateLocationFavoriteStatus(int locationId, bool isFavorite);
  void startLocationDetailsLoading();
  void updateLocationDetails(Location location);
  void updateLocationDetailsBriefly(int locationId);
  void setRouteLocationsFilter(Filter filter);
  void updateRouteLocations(List<Location> locations, int amount);
  void stopRouteLocationsLoading();
  void updateLocationsAvailableFilters(List<PremiumBasedFilterLabel> labels);
  void setFavoriteLocationsFilter(Filter filter);
  void updateFavoriteLocations(List<Location> locations, int amount);
  void stopFavoriteLocationsLoading();
}
