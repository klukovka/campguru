import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ReviewsRepositoryModule {
  @test
  @lazySingleton
  ReviewsRepository getTestReviewsRepository(
    TestDataSource dataSource,
    Dio dio,
  ) =>
      ProxyTestReviewsRepository(
        dataSource,
        dio,
      );

  @dev
  @prod
  @lazySingleton
  ReviewsRepository getApiReviewsRepository(Dio dio) =>
      ApiReviewsRepository(dio);
}
