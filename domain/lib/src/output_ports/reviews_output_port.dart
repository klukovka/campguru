import 'package:domain/domain.dart';

abstract class ReviewsOutputPort {
  void setLocationReviewsFilter(Filter filter);
  void updateLocationReviews(List<Review> reviews, int amount);
  void stopLocationReviewsLoading();
}
