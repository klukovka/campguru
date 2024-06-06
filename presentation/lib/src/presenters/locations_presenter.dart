import 'package:domain/domain.dart';
import 'package:presentation/src/bloc.dart';

class LocationsPresenter extends LocationsOutputPort {
  final LocationsTabCubit locationsTabCubit;
  final LocationDetailsPageCubit locationDetailsPageCubit;
  final RouteLocationsPageCubit routeLocationsPageCubit;
  final LocationsFiltersPageCubit locationsFiltersPageCubit;
  final FavoriteLocationsPageCubit favoriteLocationsPageCubit;

  LocationsPresenter({
    required this.locationsTabCubit,
    required this.locationDetailsPageCubit,
    required this.routeLocationsPageCubit,
    required this.locationsFiltersPageCubit,
    required this.favoriteLocationsPageCubit,
  });

  @override
  void setAllLocationsFilter(Filter filter) {
    locationsTabCubit.setFilter(filter);
    locationsFiltersPageCubit.updateCurrentFilter(filter);
  }

  @override
  void stopAllLocationsLoading() {
    locationsTabCubit.stopLoading();
    locationsFiltersPageCubit.stopLoading();
  }

  @override
  void updateAllLocations(List<Location> locations, int amount) {
    final append = locationsTabCubit.state.filter.append;

    if (append) {
      locationsTabCubit.appendLocations(locations);
    } else {
      locationsTabCubit.setLocations(locations, amount: amount);
    }
    locationsFiltersPageCubit.stopLoading();
  }

  @override
  void updateLocationFavoriteStatus(int locationId, bool isFavorite) {
    final allLocations = locationsTabCubit.state.locations.updateFavoriteStatus(
      locationId,
      isFavorite,
    );

    final routeLocations =
        routeLocationsPageCubit.state.locations.updateFavoriteStatus(
      locationId,
      isFavorite,
    );

    final favoriteLocations =
        favoriteLocationsPageCubit.state.locations.updateFavoriteStatus(
      locationId,
      isFavorite,
    );

    locationsTabCubit.setLocations(allLocations);
    routeLocationsPageCubit.setLocations(routeLocations);
    favoriteLocationsPageCubit.setLocations(favoriteLocations);

    if (locationDetailsPageCubit.state.location.id == locationId) {
      locationDetailsPageCubit.updateLocationFavoriteStatus(
        isFavorite,
      );
    }
  }

  @override
  void updateLocationDetails(Location location) {
    final allLocations = locationsTabCubit.state.locations.merge(location);
    final routeLocations =
        routeLocationsPageCubit.state.locations.merge(location);

    locationsTabCubit.setLocations(allLocations);
    routeLocationsPageCubit.setLocations(routeLocations);
    locationDetailsPageCubit.updateLocation(location);
  }

  @override
  void startLocationDetailsLoading() {
    locationDetailsPageCubit.startLoading();
  }

  @override
  void updateLocationDetailsBriefly(int locationId) {
    final location = locationsTabCubit.state.locations.firstWhereOrNull(
      (location) => location.id == locationId,
    );

    if (location != null) {
      locationDetailsPageCubit.updateLocation(location);
    } else {
      locationDetailsPageCubit.setHasError();
    }
  }

  @override
  void setRouteLocationsFilter(Filter filter) {
    routeLocationsPageCubit.setFilter(filter);
  }

  @override
  void stopRouteLocationsLoading() {
    routeLocationsPageCubit.stopLoading();
  }

  @override
  void updateRouteLocations(List<Location> locations, int amount) {
    final append = routeLocationsPageCubit.state.filter.append;

    if (append) {
      routeLocationsPageCubit.appendLocations(locations);
    } else {
      routeLocationsPageCubit.setLocations(locations, amount: amount);
    }
  }

  @override
  void updateLocationsAvailableFilters(List<PremiumBasedFilterLabel> labels) {
    locationsFiltersPageCubit.updateLabels(labels);
  }

  @override
  void setFavoriteLocationsFilter(Filter filter) {
    favoriteLocationsPageCubit.setFilter(filter);
  }

  @override
  void stopFavoriteLocationsLoading() {
    favoriteLocationsPageCubit.stopLoading();
  }

  @override
  void updateFavoriteLocations(List<Location> locations, int amount) {
    favoriteLocationsPageCubit.setLocations(locations, amount: amount);
  }
}
