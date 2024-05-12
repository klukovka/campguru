import 'package:domain/domain.dart';

class GetTripsUseCase {
  final TripsRepository tripsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final TripsOutputPort tripsOutputPort;

  GetTripsUseCase({
    required this.tripsRepository,
    required this.errorHandlerOutputPort,
    required this.tripsOutputPort,
  });

  Future<void> call(Filter filter) async {
    tripsOutputPort.setAllTripsFilter(filter);
    final trips = await tripsRepository.getTrips(filter);

    if (trips.wasSuccessful) {
      tripsOutputPort.updateAllTrips(
        trips.result!.values,
        trips.result!.fullCount,
      );
      return;
    }

    errorHandlerOutputPort.setError(trips.failure!);
    tripsOutputPort.stopAllTripsLoading();
  }
}
