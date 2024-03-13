import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class ReviewsPresenter extends ReviewsOutputPort {
  final LocationReviewsPageCubit locationReviewsPageCubit;

  ReviewsPresenter({required this.locationReviewsPageCubit});

  @override
  void setLocationReviewsFilter(Filter filter) {
    // TODO: implement setLocationReviewsFilter
  }

  @override
  void stopLocationReviewsLoading() {
    // TODO: implement stopLocationReviewsLoading
  }

  @override
  void updateLocationReviews(List<Review> reviews, int amount) {
    // TODO: implement updateLocationReviews
  }
}
