import 'package:domain/domain.dart';

class LocationsTabController {
  final GetAllLocationsUseCase getAllLocationsUseCase;

  LocationsTabController(this.getAllLocationsUseCase);

  void uploadNextPage(Filter filter) {
    getAllLocationsUseCase(filter.copyWith(page: filter.page + 1));
  }
}
