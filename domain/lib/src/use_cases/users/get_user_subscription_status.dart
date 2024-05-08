import 'package:domain/domain.dart';

class GetUserSubscriptionStatus {
  final UsersRepository usersRepository;
  final LocationsOutputPort locationsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetUserSubscriptionStatus({
    required this.usersRepository,
    required this.locationsOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call() async {
    final hasPremium = await usersRepository.hasPremium();
    if (hasPremium.wasSuccessful) {
      locationsOutputPort.updatePremiumStatus(hasPremium.result ?? false);
      return;
    }

    errorHandlerOutputPort.setError(hasPremium.failure!);
  }
}
