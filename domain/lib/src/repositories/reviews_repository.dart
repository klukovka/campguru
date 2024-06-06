import 'package:domain/domain.dart';

abstract class ReviewsRepository {
  Future<FailureOrResult<Chunk<Review>>> getLocationReviews(
    int locationId,
    Filter filter,
  );

  Future<FailureOrResult<Chunk<Review>>> getRouteReviews(
    int routeId,
    Filter filter,
  );

  Future<FailureOrResult<void>> createLocationReview(NewReview newReview);

  Future<FailureOrResult<void>> createRouteReview(NewReview newReview);
}
