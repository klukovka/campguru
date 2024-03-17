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
}
