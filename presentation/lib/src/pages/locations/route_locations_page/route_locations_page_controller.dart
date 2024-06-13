import 'package:domain/domain.dart';

class RouteLocationsPageController {
  final GetRouteLocationsUseCase getRouteLocationsUseCase;

  RouteLocationsPageController(this.getRouteLocationsUseCase);

  void initialLoading(int routeId) {
    getRouteLocationsUseCase(routeId, const Filter());
  }

  void uploadNextPage(int routeId, Filter filter) {
    getRouteLocationsUseCase(
      routeId,
      filter.copyWith(page: filter.page + 1),
    );
  }

  void search(
    int routeId, {
    required Filter currentFilter,
    required String searchValue,
  }) {
    getRouteLocationsUseCase(
        routeId,
        currentFilter.copyWith(
          search: searchValue,
          page: 1,
        ));
  }
}
