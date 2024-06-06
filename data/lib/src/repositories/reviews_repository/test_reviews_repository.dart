import 'package:data/data.dart';
import 'package:domain/domain.dart';

class TestReviewsRepository implements ReviewsRepository {
  final TestDataSource _dataSource;

  TestReviewsRepository(this._dataSource);

  @override
  Future<FailureOrResult<Chunk<Review>>> getLocationReviews(
    int locationId,
    Filter filter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      _dataSource.generateReviews(size: filter.size, page: filter.page),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Review>>> getRouteReviews(
    int routeId,
    Filter filter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      _dataSource.generateReviews(size: filter.size, page: filter.page),
    );
  }

  @override
  Future<FailureOrResult<void>> createLocationReview(
    NewReview newReview,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(null);
  }

  @override
  Future<FailureOrResult<void>> createRouteReview(NewReview newReview) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(null);
  }
}
