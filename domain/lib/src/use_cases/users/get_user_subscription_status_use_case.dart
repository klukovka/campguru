import 'package:domain/domain.dart';

class GetUserSubscriptionStatusUseCase {
  final UsersRepository usersRepository;
  final LocationsOutputPort locationsOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  GetUserSubscriptionStatusUseCase({
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
