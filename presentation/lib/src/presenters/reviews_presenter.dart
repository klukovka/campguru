import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class ReviewsPresenter extends ReviewsOutputPort {
  final LocationReviewsPageCubit locationReviewsPageCubit;
  final RouteReviewsPageCubit routeReviewsPageCubit;

  ReviewsPresenter({
    required this.locationReviewsPageCubit,
    required this.routeReviewsPageCubit,
  });

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
    routeReviewsPageCubit.setFilter(filter);
  }

  @override
  void stopRouteReviewsLoading() {
    routeReviewsPageCubit.stopLoading();
  }

  @override
  void updateRouteReviews(List<Review> reviews, int amount) {
    final append = routeReviewsPageCubit.state.filter.append;
    if (append) {
      routeReviewsPageCubit.appendReview(reviews);
    } else {
      routeReviewsPageCubit.setReviews(reviews, amount: amount);
    }
  }
}
