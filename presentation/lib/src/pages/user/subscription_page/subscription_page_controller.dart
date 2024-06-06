import 'package:domain/domain.dart';

class SubscriptionPageController {
  final CreateSubscriptionUseCase createSubscriptionUseCase;

  SubscriptionPageController(this.createSubscriptionUseCase);

  void call({
    required String phone,
    required String card,
    required String cardExpMonth,
    required String cardExpYear,
    required String cardCvv,
    required String cardHolderName,
    required Subscription subscription,
  }) {
    final payment = Payment(
      phone: '38$phone',
      card: card,
      cardExpMonth: cardExpMonth,
      cardExpYear: cardExpYear,
      cardCvv: cardCvv,
      cardHolderName: cardHolderName,
      subscriptionType: subscription.type,
      cashAmount: subscription.price,
    );
    createSubscriptionUseCase(payment);
  }
}
