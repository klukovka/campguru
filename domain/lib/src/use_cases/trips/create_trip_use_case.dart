import 'package:domain/domain.dart';

class CreateTripUseCase {
  final TripsRepository tripsRepository;
  final TripsOutputPort tripsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  CreateTripUseCase({
    required this.tripsRepository,
    required this.tripsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(NewTrip newTrip) async {
    tripsOutputPort.startCreateTripLoading();
    final result = await tripsRepository.createNewTrip(newTrip);

    if (result.hasFailed) {
      errorHandlerOutputPort.setError(result.failure!);
      tripsOutputPort.stopCreateTripLoading();
      return;
    }

    //TODO: Add chats creation
    tripsOutputPort.completeTripCreation(result.result!);
  }
}
