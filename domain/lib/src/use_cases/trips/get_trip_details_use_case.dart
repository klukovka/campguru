import 'package:domain/domain.dart';

class GetTripDetailsUseCase {
  final TripsRepository tripsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final TripsOutputPort tripsOutputPort;

  GetTripDetailsUseCase({
    required this.tripsRepository,
    required this.errorHandlerOutputPort,
    required this.tripsOutputPort,
  });

  Future<void> call(int tripId) async {
    tripsOutputPort.startTripDetailsLoading();
    final tripDetails = await tripsRepository.getTripDetails(
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
