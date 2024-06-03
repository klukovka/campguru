import 'package:domain/domain.dart';

class CreateTripUseCase {
  final TripsRepository tripsRepository;
  final ChatsRepository chatsRepository;
  final PreferencesRepository preferencesRepository;
  final TripsOutputPort tripsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  CreateTripUseCase({
    required this.tripsRepository,
    required this.tripsOutputPort,
    required this.chatsRepository,
    required this.preferencesRepository,
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

    await chatsRepository.createTripChat(
      result.result!,
      preferencesRepository.userId.toString(),
    );
    tripsOutputPort.completeTripCreation(result.result!);
  }
}
