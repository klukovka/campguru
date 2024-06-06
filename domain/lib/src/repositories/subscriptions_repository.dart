import 'package:domain/domain.dart';

abstract class SubscriptionsRepository {
  Future<FailureOrResult<List<Subscription>>> getSubscriptions();
  Future<FailureOrResult<User>> createSubscription(Payment payment);
}
