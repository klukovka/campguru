import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SubscriptionsUseCasesModule {
  @lazySingleton
  GetAvailableSubscriptionsUseCase getAvailableSubscriptionsUseCase(
    SubscriptionsRepository subscriptionsRepository,
    SubscriptionsOutputPort subscriptionsOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      GetAvailableSubscriptionsUseCase(
        subscriptionsRepository: subscriptionsRepository,
        subscriptionsOutputPort: subscriptionsOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );
}
