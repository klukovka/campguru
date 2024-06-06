import 'package:domain/domain.dart';

class CreateReviewUseCase {
  final ReviewsRepository reviewsRepository;
  final ReviewsOutputPort reviewsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  CreateReviewUseCase({
    required this.reviewsRepository,
    required this.reviewsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(NewReview newReview) async {
    reviewsOutputPort.startReviewCreationLoading();
    final review = await switch (newReview.reviewType) {
      ReviewType.location => reviewsRepository.createLocationReview(newReview),
      ReviewType.route => reviewsRepository.createRouteReview(newReview),
    };

    if (review.hasFailed) {
      reviewsOutputPort.reviewCreationFailed();
      errorHandlerOutputPort.setError(review.failure!);
      return;
    }

    reviewsOutputPort.reviewCreationcompletedSuccessfully();
  }
}
