import 'package:data/data.dart';
import 'package:data/src/core/proxy_test_repository.dart';
import 'package:data/src/repositories/reviews_repository/test_reviews_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ProxyTestReviewsRepository extends ProxyTestRepository
    implements ReviewsRepository {
  final TestReviewsRepository testReviewsRepository;
  final ApiReviewsRepository apiReviewsRepository;

  ProxyTestReviewsRepository(TestDataSource testDataSource, Dio client)
      : testReviewsRepository = TestReviewsRepository(testDataSource),
        apiReviewsRepository = ApiReviewsRepository(client);

  @override
  Future<FailureOrResult<void>> createLocationReview(
    NewReview newReview,
  ) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          apiReviewsRepository.createLocationReview(newReview),
      testRequest: () async =>
          testReviewsRepository.createLocationReview(newReview),
    );
  }

  @override
  Future<FailureOrResult<void>> createRouteReview(NewReview newReview) async {
    return await makeSafeRequest(
      apiRequest: () async => apiReviewsRepository.createRouteReview(newReview),
      testRequest: () async =>
          testReviewsRepository.createRouteReview(newReview),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Review>>> getLocationReviews(
    int locationId,
    Filter filter,
  ) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          apiReviewsRepository.getLocationReviews(locationId, filter),
      testRequest: () async =>
          testReviewsRepository.getLocationReviews(locationId, filter),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Review>>> getRouteReviews(
    int routeId,
    Filter filter,
  ) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          apiReviewsRepository.getRouteReviews(routeId, filter),
      testRequest: () async =>
          testReviewsRepository.getRouteReviews(routeId, filter),
    );
  }
}
