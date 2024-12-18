import 'package:domain/domain.dart';

abstract class SubscriptionsOutputPort {
  void setSubscriptions(List<Subscription> subscriptions);
  void startLoading();
  void stopLoading();
}
