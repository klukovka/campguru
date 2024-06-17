part of 'subscription_page_cubit.dart';

class SubscriptionPageState extends Equatable {
  final User? user;
  final List<Subscription> subscriptions;
  final bool isLoading;

  const SubscriptionPageState({
    this.user,
    this.subscriptions = const [],
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [user, subscriptions, isLoading];

  SubscriptionPageState copyWith({
    Nullable<User>? user,
    List<Subscription>? subscriptions,
    bool? isLoading,
  }) {
    return SubscriptionPageState(
      user: user == null ? this.user : user.value,
      subscriptions: subscriptions ?? this.subscriptions,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
