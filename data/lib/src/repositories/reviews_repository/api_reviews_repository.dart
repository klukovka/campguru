import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/filters/filter_serializer.dart';
import 'package:data/src/models/reviews/reviews_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiReviewsRepository implements ReviewsRepository {
  final Dio client;

  ApiReviewsRepository(this.client);

  @override
  Future<FailureOrResult<void>> createLocationReview(NewReview newReview) {
    // TODO: implement createLocationReview
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<void>> createRouteReview(NewReview newReview) {
    // TODO: implement createRouteReview
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Review>>> getLocationReviews(
    int locationId,
    Filter filter,
  ) async {
    final query = FilterSerializer(filter).toString();
    final response = await client.get(
      '/api/locations/$locationId/reviews?$query',
    );
    return response.toFailureOrResult(ReviewsDto.fromJson);
  }

  @override
  Future<FailureOrResult<Chunk<Review>>> getRouteReviews(
    int routeId,
    Filter filter,
  ) async {
    final query = FilterSerializer(filter).toString();
    final response = await client.get(
      '/api/routes/$routeId/reviews?$query',
    );
    return response.toFailureOrResult(ReviewsDto.fromJson);
  }
}
