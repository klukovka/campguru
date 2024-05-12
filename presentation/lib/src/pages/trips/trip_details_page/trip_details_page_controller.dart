import 'package:domain/domain.dart';

class TripDetailsPageController {
  final GetTripDetailsUseCase getTripDetailsUseCase;

  TripDetailsPageController(this.getTripDetailsUseCase);

  void call(int routeId) {
    getTripDetailsUseCase(routeId);
  }
}
