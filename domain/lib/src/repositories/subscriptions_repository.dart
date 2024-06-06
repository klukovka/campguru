import 'package:domain/domain.dart';

abstract class SubscriptionsRepository {
  Future<FailureOrResult<List<Subscription>>> getSubscriptions();
  Future<FailureOrResult<Subscription>> getSubscription(int id);
  Future<FailureOrResult<User>> createSubscription(Payment payment);
}
