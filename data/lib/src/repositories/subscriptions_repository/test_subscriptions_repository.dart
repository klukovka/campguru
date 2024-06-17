import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/data_source/subscriptions_data_source.dart';
import 'package:data/src/models/users/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class TestSubscriptionRepository implements SubscriptionsRepository {
  final SubscriptionsDataSource source;
  final Dio client;

  TestSubscriptionRepository({
    required this.source,
    required this.client,
  });

  @override
  Future<FailureOrResult<User>> createSubscription(Payment payment) async {
    final response = await client.get('/auth/current-user');
    final failureOrResult = response.toFailureOrResult(UserDto.fromJson);
    final currentDate = DateTime.now().toUtc();
    final result = failureOrResult.result?.copyWith(
      premiumExpirationDate: Nullable(switch (payment.subscriptionType) {
        SubscriptionType.monthly =>
          currentDate.copyWith(month: currentDate.month + 1),
        SubscriptionType.yearly =>
          currentDate.copyWith(year: currentDate.year + 1),
      }),
    );
    return FailureOrResult(
      failure: failureOrResult.failure,
      result: result,
    );
  }

  @override
  Future<FailureOrResult<List<Subscription>>> getSubscriptions() async {
    return FailureOrResult.success(source.availableSubscriptions);
  }
}
