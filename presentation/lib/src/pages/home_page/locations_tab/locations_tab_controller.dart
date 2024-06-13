import 'package:domain/domain.dart';

class LocationsTabController {
  final GetAllLocationsUseCase getAllLocationsUseCase;

  LocationsTabController(this.getAllLocationsUseCase);

  void uploadNextPage(Filter filter) {
    getAllLocationsUseCase(filter.copyWith(page: filter.page + 1));
  }

  void search(Filter currentFilter, String searchValue) {
    getAllLocationsUseCase(currentFilter.copyWith(
      search: searchValue,
      page: 1,
    ));
  }
}
