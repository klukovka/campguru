import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiSubscriptionRepository implements SubscriptionsRepository {
  final SubscriptionsDataSource source;
  final Dio client;

  ApiSubscriptionRepository({
    required this.source,
    required this.client,
  });

  @override
  Future<FailureOrResult<User>> createSubscription(Payment payment) {
    // TODO: implement createSubscription
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<List<Subscription>>> getSubscriptions() async {
    return FailureOrResult.success(source.availableSubscriptions);
  }
}
