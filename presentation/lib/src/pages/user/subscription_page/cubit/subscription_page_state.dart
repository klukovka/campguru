part of 'subscription_page_cubit.dart';

class SubscriptionPageState extends Equatable {
  final User? user;
  final List<Subscription> subscriptions;
  final bool isLoading;
  final bool hasError;

  const SubscriptionPageState({
    this.user,
    this.subscriptions = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  @override
  List<Object?> get props => [user, subscriptions];

  SubscriptionPageState copyWith({
    Nullable<User>? user,
    List<Subscription>? subscriptions,
    bool? isLoading,
    bool? hasError,
  }) {
    return SubscriptionPageState(
      user: user == null ? this.user : user.value,
      subscriptions: subscriptions ?? this.subscriptions,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
