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
      locationsTabCubit.appendLocations(locations, amount);
    } else {
      locationsTabCubit.setLocations(locations, amount);
    }
  }
}
