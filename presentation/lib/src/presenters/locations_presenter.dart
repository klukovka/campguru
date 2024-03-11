import 'package:domain/domain.dart';
import 'package:presentation/src/pages/home_page/locations_tab/cubit/locations_tab_cubit.dart';

class LocationsPresenter extends LocationsOutputPort {
  final LocationsTabCubit locationsTabCubit;

  LocationsPresenter({required this.locationsTabCubit});

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
  }
}
