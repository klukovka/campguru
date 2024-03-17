import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ReviewUseCasesModule {
  @lazySingleton
  GetLocationReviewsUseCase getLocationReviewsUseCase(
    ReviewsRepository reviewsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    ReviewsOutputPort reviewsOutputPort,
  ) =>
      GetLocationReviewsUseCase(
        reviewsRepository: reviewsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        reviewsOutputPort: reviewsOutputPort,
      );

  @lazySingleton
  GetRouteReviewsUseCase getRouteReviewsUseCase(
    ReviewsRepository reviewsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    ReviewsOutputPort reviewsOutputPort,
  ) =>
      GetRouteReviewsUseCase(
        reviewsRepository: reviewsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        reviewsOutputPort: reviewsOutputPort,
      );
}
