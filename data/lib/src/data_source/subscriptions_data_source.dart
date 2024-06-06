import 'package:domain/domain.dart';

class SubscriptionsDataSource {
  List<Subscription> get availableSubscriptions {
    return [
      Subscription(
        id: 1,
        type: SubscriptionType.monthly,
        price: 400,
      ),
      Subscription(
        id: 2,
        type: SubscriptionType.yearly,
        price: 3840,
        discount: 20,
      ),
    ];
  }
}
