import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class SubscriptionsPresenter implements SubscriptionsOutputPort {
  final SubscriptionPageCubit subscriptionPageCubit;

  SubscriptionsPresenter({
    required this.subscriptionPageCubit,
  });
  @override
  void setSubscriptions(List<Subscription> subscriptions) {
    subscriptionPageCubit.setSubscriptions(subscriptions);
  }

  @override
  void startLoading() {
    subscriptionPageCubit.startLoading();
  }

  @override
  void stopLoading() {
    subscriptionPageCubit.stopLoading();
  }
}
