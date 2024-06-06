import 'package:domain/domain.dart';

class GetAvailableSubscriptionsUseCase {
  final SubscriptionsRepository subscriptionsRepository;
  final SubscriptionsOutputPort subscriptionsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetAvailableSubscriptionsUseCase({
    required this.subscriptionsRepository,
    required this.subscriptionsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call() async {
    final subscriptions = await subscriptionsRepository.getSubscriptions();

    if (subscriptions.hasFailed) {
      errorHandlerOutputPort.setError(subscriptions.failure!);
      return;
    }

    subscriptionsOutputPort.setSubscriptions(subscriptions.result!);
  }
}
