import 'package:domain/domain.dart';

class FavoriteLocationsPageController {
  final GetFavoriteLocationsUseCase getFavoriteLocationsUseCase;

  FavoriteLocationsPageController(this.getFavoriteLocationsUseCase);

  void initialLoading() {
    getFavoriteLocationsUseCase(const Filter());
  }

  void uploadNextPage(Filter filter) {
    getFavoriteLocationsUseCase(
      filter.copyWith(page: filter.page + 1),
    );
  }

  void search({
    required Filter currentFilter,
    required String searchValue,
  }) {
    getFavoriteLocationsUseCase(currentFilter.copyWith(
      search: searchValue,
      page: 1,
    ));
  }
}
