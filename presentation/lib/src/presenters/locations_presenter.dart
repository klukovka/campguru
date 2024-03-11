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
}
