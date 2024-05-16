import 'package:domain/domain.dart';

class CachedRoutesTabController {
  final GetCachedRoutesUseCase getCachedRoutesUseCase;

  CachedRoutesTabController(this.getCachedRoutesUseCase);

  void initialLoading() {
    getCachedRoutesUseCase();
  }

  void search(String searchValue) {
    getCachedRoutesUseCase(searchQuery: searchValue);
  }
}
