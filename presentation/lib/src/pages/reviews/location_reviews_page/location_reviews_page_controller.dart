import 'package:domain/domain.dart';

class LocationReviewsPageController {
  final GetLocationReviewsUseCase getLocationReviewsUseCase;

  LocationReviewsPageController(this.getLocationReviewsUseCase);

  void initalLoading(int locationId) {
    getLocationReviewsUseCase(locationId, const Filter());
  }

  void uploadNextPage(int locationId, Filter filter) {
    getLocationReviewsUseCase(
      locationId,
      filter.copyWith(page: filter.page + 1),
    );
  }
}
