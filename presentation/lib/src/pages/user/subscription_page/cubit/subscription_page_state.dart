part of 'subscription_page_cubit.dart';

class SubscriptionPageState extends Equatable {
  final DateTime? expirationDate;

  const SubscriptionPageState({
    this.expirationDate,
  });

  @override
  List<Object> get props => [];

  SubscriptionPageState copyWith({
    Nullable<DateTime>? expirationDate,
  }) {
    return SubscriptionPageState(
      expirationDate:
          expirationDate == null ? this.expirationDate : expirationDate.value,
    );
  }
}
