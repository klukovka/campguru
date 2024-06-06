import 'package:domain/domain.dart';

abstract class ReviewsOutputPort {
  void setLocationReviewsFilter(Filter filter);
  void updateLocationReviews(List<Review> reviews, int amount);
  void stopLocationReviewsLoading();
  void setRouteReviewsFilter(Filter filter);
  void updateRouteReviews(List<Review> reviews, int amount);
  void stopRouteReviewsLoading();

  void startReviewCreationLoading();
  void reviewCreationFailed();
  void reviewCreationcompletedSuccessfully();
}
