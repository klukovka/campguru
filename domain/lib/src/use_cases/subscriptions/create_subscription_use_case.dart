import 'package:domain/domain.dart';

class CreateSubscriptionUseCase {
  final SubscriptionsRepository subscriptionsRepository;
  final SubscriptionsOutputPort subscriptionsOutputPort;
  final CurrentUserOutputPort currentUserOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  CreateSubscriptionUseCase({
    required this.subscriptionsRepository,
    required this.subscriptionsOutputPort,
    required this.currentUserOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(Payment payment) async {
    subscriptionsOutputPort.startLoading();
    final user = await subscriptionsRepository.createSubscription(payment);

    if (user.hasFailed) {
      errorHandlerOutputPort.setError(user.failure!);
    } else {
      currentUserOutputPort.setCurrentUser(user.result!);
    }

    subscriptionsOutputPort.stopLoading();
  }
}
