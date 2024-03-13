import 'package:domain/domain.dart';

class GetLocationReviewsUseCase {
  final ReviewsRepository reviewsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final ReviewsOutputPort reviewsOutputPort;

  GetLocationReviewsUseCase({
    required this.reviewsRepository,
    required this.errorHandlerOutputPort,
    required this.reviewsOutputPort,
  });

  Future<void> call(int locationId, Filter filter) async {
    reviewsOutputPort.setLocationReviewsFilter(filter);
    final reviews =
        await reviewsRepository.getLocationReviews(locationId, filter);

    if (reviews.wasSuccessful) {
      reviewsOutputPort.updateLocationReviews(
        reviews.result!.values,
        reviews.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(reviews.failure!);
    reviewsOutputPort.stopLocationReviewsLoading();
  }
}
