import 'package:domain/domain.dart';

class SetTripRouteUseCase {
  final TripsOutputPort tripsOutputPort;

  SetTripRouteUseCase(this.tripsOutputPort);

  void call(Route? route) {
    tripsOutputPort.setTripRoute(route);
  }
}
