import 'package:data/data.dart';
import 'package:data/src/core/proxy_test_repository.dart';
import 'package:data/src/repositories/subscriptions_repository/test_subscriptions_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ProxyTestSubscriptionRepository extends ProxyTestRepository
    implements SubscriptionsRepository {
  final TestSubscriptionRepository testSubscriptionRepository;
  final ApiSubscriptionRepository apiSubscriptionRepository;

  ProxyTestSubscriptionRepository({
    required SubscriptionsDataSource source,
    required Dio client,
  })  : testSubscriptionRepository = TestSubscriptionRepository(
          source: source,
          client: client,
        ),
        apiSubscriptionRepository =
            ApiSubscriptionRepository(source: source, client: client);

  @override
  Future<FailureOrResult<User>> createSubscription(Payment payment) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiSubscriptionRepository.createSubscription(payment),
      testRequest: () async =>
          await testSubscriptionRepository.createSubscription(payment),
    );
  }

  @override
  Future<FailureOrResult<List<Subscription>>> getSubscriptions() async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiSubscriptionRepository.getSubscriptions(),
      testRequest: () async =>
          await testSubscriptionRepository.getSubscriptions(),
    );
  }
}
