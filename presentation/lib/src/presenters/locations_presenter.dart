import 'package:domain/domain.dart';
import 'package:presentation/src/bloc.dart';

class LocationsPresenter extends LocationsOutputPort {
  final LocationsTabCubit locationsTabCubit;
  final LocationDetailsPageCubit locationDetailsPageCubit;

  LocationsPresenter({
    required this.locationsTabCubit,
    required this.locationDetailsPageCubit,
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

    locationsTabCubit.setLocations(allLocations);

    if (locationDetailsPageCubit.state.location.id == locationId) {
      locationDetailsPageCubit.updateLocationFavoriteStatus(
        isFavorite,
      );
    }
  }

  @override
  void updateLocationDetails(Location location) {
    final allLocations = locationsTabCubit.state.locations.map((item) {
      return item.id == location.id ? item.merge(location) : item;
    }).toList();

    locationsTabCubit.setLocations(allLocations);
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
}
