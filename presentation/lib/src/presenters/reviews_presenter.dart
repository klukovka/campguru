import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class ReviewsPresenter extends ReviewsOutputPort {
  final LocationReviewsPageCubit locationReviewsPageCubit;

  ReviewsPresenter({required this.locationReviewsPageCubit});

  @override
  void setLocationReviewsFilter(Filter filter) {
    locationReviewsPageCubit.setFilter(filter);
  }

  @override
  void stopLocationReviewsLoading() {
    locationReviewsPageCubit.stopLoading();
  }

  @override
  void updateLocationReviews(List<Review> reviews, int amount) {
    final append = locationReviewsPageCubit.state.filter.append;
    if (append) {
      locationReviewsPageCubit.appendReview(reviews);
    } else {
      locationReviewsPageCubit.setReviews(reviews, amount: amount);
    }
  }

  @override
  void setRouteReviewsFilter(Filter filter) {
    // TODO: implement setRouteReviewsFilter
  }

  @override
  void stopRouteReviewsLoading() {
    // TODO: implement stopRouteReviewsLoading
  }

  @override
  void updateRouteReviews(List<Review> reviews, int amount) {
    // TODO: implement updateRouteReviews
  }
}
