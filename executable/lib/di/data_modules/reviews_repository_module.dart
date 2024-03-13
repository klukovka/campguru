import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ReviewsRepositoryModule {
  @test
  @lazySingleton
  ReviewsRepository getTestReviewsRepository(TestDataSource dataSource) =>
      TestReviewsRepository(
        dataSource,
      );
}
