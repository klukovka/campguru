import 'package:domain/domain.dart';

class FavoriteRoutesTabController {
  final GetFavoriteRoutesUseCase getFavoriteRoutesUseCase;
  final SetTripRouteUseCase setTripRouteUseCase;

  FavoriteRoutesTabController({
    required this.getFavoriteRoutesUseCase,
    required this.setTripRouteUseCase,
  });

  void initialLoading() {
    getFavoriteRoutesUseCase(const Filter());
  }

  void uploadNextPage(Filter filter) {
    getFavoriteRoutesUseCase(
      filter.copyWith(page: filter.page + 1),
    );
  }

  void search({
    required Filter currentFilter,
    required String searchValue,
  }) {
    getFavoriteRoutesUseCase(currentFilter.copyWith(
      search: searchValue,
      page: 1,
    ));
  }

  void selectRoute(Route? route) {
    setTripRouteUseCase(route);
  }
}
