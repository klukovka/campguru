import 'package:domain/domain.dart';

class CachedRoutesTabController {
  final GetCachedRoutesUseCase getCachedRoutesUseCase;
  final DeleteCachedRouteUseCase deleteCachedRouteUseCase;

  CachedRoutesTabController({
    required this.getCachedRoutesUseCase,
    required this.deleteCachedRouteUseCase,
  });

  void initialLoading() {
    getCachedRoutesUseCase();
  }

  void search(String searchValue) {
    getCachedRoutesUseCase(searchQuery: searchValue);
  }

  void deleteRoute(int routeId, String searchQuery) {
    deleteCachedRouteUseCase(routeId, searchQuery);
  }
}
