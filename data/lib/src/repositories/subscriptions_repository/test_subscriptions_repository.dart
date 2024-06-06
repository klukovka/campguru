import 'package:data/src/data_source/subscriptions_data_source.dart';
import 'package:domain/domain.dart';

class TestSubscriptionRepository implements SubscriptionsRepository {
  final SubscriptionsDataSource source;

  TestSubscriptionRepository({required this.source});

  @override
  Future<FailureOrResult<User>> createSubscription(Payment payment) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return FailureOrResult.failure(ApplicationFailure(
      type: ApplicationErrorType.general,
    ));
  }

  @override
  Future<FailureOrResult<List<Subscription>>> getSubscriptions() async {
    return FailureOrResult.success(source.availableSubscriptions);
  }
}
