import 'package:domain/domain.dart';

class MyOwnRoutesTabController {
  final GetMyOwnRoutesUseCase getMyOwnRoutesUseCase;

  MyOwnRoutesTabController(this.getMyOwnRoutesUseCase);

  void initialLoading() {
    getMyOwnRoutesUseCase(const Filter());
  }

  void uploadNextPage(Filter filter) {
    getMyOwnRoutesUseCase(
      filter.copyWith(page: filter.page + 1),
    );
  }

  void search({
    required Filter currentFilter,
    required String searchValue,
  }) {
    getMyOwnRoutesUseCase(currentFilter.copyWith(
      search: searchValue,
      page: 1,
    ));
  }
}
