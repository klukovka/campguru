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
    final locations =
        await reviewsRepository.getLocationReviews(locationId, filter);

    if (locations.wasSuccessful) {
      reviewsOutputPort.updateLocationReviews(
        locations.result!.values,
        locations.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(locations.failure!);
    reviewsOutputPort.stopLocationReviewsLoading();
  }
}
