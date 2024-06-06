import 'package:domain/domain.dart';

class CreateReviewPageController {
  final CreateReviewUseCase createReviewUseCase;

  CreateReviewPageController(this.createReviewUseCase);

  void call(NewReview newReview) {
    createReviewUseCase(newReview);
  }
}
