import 'package:domain/domain.dart';

class TripsTabController {
  final GetTripsUseCase getTripsUseCase;

  TripsTabController(this.getTripsUseCase);

  void uploadNextPage(Filter filter) {
    getTripsUseCase(filter.copyWith(page: filter.page + 1));
  }

  void search(Filter currentFilter, String searchValue) {
    getTripsUseCase(currentFilter.copyWith(
      search: searchValue,
      page: 1,
    ));
  }
}
