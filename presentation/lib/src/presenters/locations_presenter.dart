import 'package:domain/domain.dart';
import 'package:presentation/src/bloc.dart';

class LocationsPresenter extends LocationsOutputPort {
  final LocationsTabCubit locationsTabCubit;
  final LocationDetailsPageCubit locationDetailsPageCubit;
  final RouteLocationsPageCubit routeLocationsPageCubit;

  LocationsPresenter({
    required this.locationsTabCubit,
    required this.locationDetailsPageCubit,
    required this.routeLocationsPageCubit,
  });

  @override
  void setAllLocationsFilter(Filter filter) {
    locationsTabCubit.setFilter(filter);
  }

  @override
  void stopAllLocationsLoading() {
    locationsTabCubit.stopLoading();
  }

  @override
  void updateAllLocations(List<Location> locations, int amount) {
    final append = locationsTabCubit.state.filter.append;

    if (append) {
      locationsTabCubit.appendLocations(locations);
    } else {
      locationsTabCubit.setLocations(locations, amount: amount);
    }
  }

  @override
  void updateLocationFavoriteStatus(int locationId, bool isFavorite) {
    final allLocations = locationsTabCubit.state.locations.map((item) {
      return item.id == locationId
          ? item.copyWith(isFavorite: isFavorite)
          : item;
    }).toList();
    final routeLocations = routeLocationsPageCubit.state.locations.map((item) {
      return item.id == locationId
          ? item.copyWith(isFavorite: isFavorite)
          : item;
    }).toList();

    locationsTabCubit.setLocations(allLocations);
    routeLocationsPageCubit.setLocations(routeLocations);

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
    final location =
        locationsTabCubit.state.locations.cast<Location?>().firstWhere(
              (location) => location?.id == locationId,
              orElse: () => null,
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
}
