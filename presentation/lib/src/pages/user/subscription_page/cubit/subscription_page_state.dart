part of 'subscription_page_cubit.dart';

class SubscriptionPageState extends Equatable {
  final DateTime? expirationDate;
  final List<Subscription> subscriptions;

  const SubscriptionPageState({
    this.expirationDate,
    this.subscriptions = const [],
  });

  @override
  List<Object?> get props => [expirationDate, subscriptions];

  SubscriptionPageState copyWith({
    Nullable<DateTime>? expirationDate,
    List<Subscription>? subscriptions,
  }) {
    return SubscriptionPageState(
      expirationDate:
          expirationDate == null ? this.expirationDate : expirationDate.value,
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }
}
