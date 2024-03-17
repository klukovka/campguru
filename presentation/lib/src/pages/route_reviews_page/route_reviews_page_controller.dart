import 'package:domain/domain.dart';

class RouteReviewsPageController {
  final GetRouteReviewsUseCase getRouteReviewsUseCase;

  RouteReviewsPageController(this.getRouteReviewsUseCase);

  void initalLoading(int routeId) {
    getRouteReviewsUseCase(routeId, const Filter());
  }

  void uploadNextPage(int routeId, Filter filter) {
    getRouteReviewsUseCase(
      routeId,
      filter.copyWith(page: filter.page + 1),
    );
  }
}
