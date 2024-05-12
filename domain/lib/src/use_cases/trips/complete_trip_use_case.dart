import 'package:domain/domain.dart';

class CompleteTripUseCase {
  final TripsRepository tripsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final TripsOutputPort tripsOutputPort;

  CompleteTripUseCase({
    required this.tripsRepository,
    required this.errorHandlerOutputPort,
    required this.tripsOutputPort,
  });

  Future<void> call(int tripId) async {
    tripsOutputPort.startCompeteTrip();
    final tripDetails = await tripsRepository.completeTrip(
      tripId,
    );

    if (tripDetails.wasSuccessful) {
      tripsOutputPort.updateTripDetails(tripDetails.result!);
      return;
    }

    errorHandlerOutputPort.setError(tripDetails.failure!);
    tripsOutputPort.updateTripDetailsBriefly(tripId);
  }
}
