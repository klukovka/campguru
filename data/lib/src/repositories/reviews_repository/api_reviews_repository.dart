import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/filters/filter_serializer.dart';
import 'package:data/src/models/reviews/new_review_dto.dart';
import 'package:data/src/models/reviews/reviews_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiReviewsRepository implements ReviewsRepository {
  final Dio client;

  ApiReviewsRepository(this.client);

  @override
  Future<FailureOrResult<void>> createLocationReview(
    NewReview newReview,
  ) async {
    final response = await client.post(
      '/api/locations/${newReview.id}/reviews',
      data: NewReviewDto.fromDomain(newReview).toJson(),
    );
    return response.toFailureOrResult((json) => null);
  }

  @override
  Future<FailureOrResult<void>> createRouteReview(NewReview newReview) async {
    final response = await client.post(
      '/api/routes/${newReview.id}/reviews',
      data: NewReviewDto.fromDomain(newReview).toJson(),
    );
    return response.toFailureOrResult((json) => null);
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
