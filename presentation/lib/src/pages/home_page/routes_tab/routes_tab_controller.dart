import 'package:domain/domain.dart';

class RoutesTabController {
  final GetAllRoutesUseCase getAllRoutesUseCase;

  RoutesTabController(this.getAllRoutesUseCase);

  void uploadNextPage(Filter filter) {
    getAllRoutesUseCase(filter.copyWith(page: filter.page + 1));
  }

  void search(Filter currentFilter, String searchValue) {
    getAllRoutesUseCase(currentFilter.copyWith(
      search: searchValue,
      page: 1,
    ));
  }
}
