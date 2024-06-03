import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class TripUseCasesModule {
  @lazySingleton
  GetTripsUseCase getAllTripsUseCase(
    TripsRepository tripsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    TripsOutputPort tripsOutputPort,
  ) =>
      GetTripsUseCase(
        tripsRepository: tripsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        tripsOutputPort: tripsOutputPort,
      );

  @lazySingleton
  GetTripDetailsUseCase getTripDetailsUseCase(
    TripsRepository tripsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    TripsOutputPort tripsOutputPort,
  ) =>
      GetTripDetailsUseCase(
        tripsRepository: tripsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        tripsOutputPort: tripsOutputPort,
      );

  @lazySingleton
  CompleteTripUseCase completeTripUseCase(
    TripsRepository tripsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    TripsOutputPort tripsOutputPort,
  ) =>
      CompleteTripUseCase(
        tripsRepository: tripsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        tripsOutputPort: tripsOutputPort,
      );

  @lazySingleton
  SetTripRouteUseCase setTripRouteUseCase(TripsOutputPort tripsOutputPort) =>
      SetTripRouteUseCase(tripsOutputPort);

  @lazySingleton
  CreateTripUseCase createTripUseCase(
    TripsRepository tripsRepository,
    TripsOutputPort tripsOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    ChatsRepository chatsRepository,
    PreferencesRepository preferencesRepository,
  ) =>
      CreateTripUseCase(
        tripsRepository: tripsRepository,
        tripsOutputPort: tripsOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
        chatsRepository: chatsRepository,
        preferencesRepository: preferencesRepository,
      );
}
