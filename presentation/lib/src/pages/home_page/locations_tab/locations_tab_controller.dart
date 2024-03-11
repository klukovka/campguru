import 'dart:developer';

import 'package:domain/domain.dart';

class LocationsTabController {
  final GetAllLocationsUseCase getAllLocationsUseCase;

  LocationsTabController(this.getAllLocationsUseCase);

  void uploadNextPage(Filter filter) {
    log('LocationsTabController');
    getAllLocationsUseCase(filter.copyWith(page: filter.page + 1));
  }
}
