import 'package:domain/domain.dart';

class FavoriteRoutesTabController {
  final GetFavoriteRoutesUseCase getFavoriteRoutesUseCase;

  FavoriteRoutesTabController(this.getFavoriteRoutesUseCase);

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
      page: 0,
    ));
  }
}
