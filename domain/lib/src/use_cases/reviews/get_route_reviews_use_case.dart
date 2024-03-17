import 'package:domain/domain.dart';

class GetRouteReviewsUseCase {
  final ReviewsRepository reviewsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final ReviewsOutputPort reviewsOutputPort;

  GetRouteReviewsUseCase({
    required this.reviewsRepository,
    required this.errorHandlerOutputPort,
    required this.reviewsOutputPort,
  });

  Future<void> call(int routeId, Filter filter) async {
    reviewsOutputPort.setRouteReviewsFilter(filter);
    final reviews = await reviewsRepository.getRouteReviews(routeId, filter);

    if (reviews.wasSuccessful) {
      reviewsOutputPort.updateRouteReviews(
        reviews.result!.values,
        reviews.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(reviews.failure!);
    reviewsOutputPort.stopRouteReviewsLoading();
  }
}
