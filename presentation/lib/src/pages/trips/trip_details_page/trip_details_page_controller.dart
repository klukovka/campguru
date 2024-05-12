import 'package:domain/domain.dart';

class TripDetailsPageController {
  final GetTripDetailsUseCase getTripDetailsUseCase;
  final CompleteTripUseCase completeTripUseCase;

  TripDetailsPageController(
    this.getTripDetailsUseCase,
    this.completeTripUseCase,
  );

  void getDetails(int tripId) {
    getTripDetailsUseCase(tripId);
  }

  void complete(int tripId) {
    completeTripUseCase(tripId);
  }
}
