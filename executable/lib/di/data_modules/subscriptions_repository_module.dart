import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SubscriptionsRepositoryModule {
  @test
  @lazySingleton
  SubscriptionsRepository testSubscriptionRepository(
    Dio dio,
    SubscriptionsDataSource source,
  ) =>
      ProxyTestSubscriptionRepository(
        source: source,
        client: dio,
      );

  @dev
  @prod
  @lazySingleton
  SubscriptionsRepository apiSubscriptionRepository(
    Dio dio,
    SubscriptionsDataSource source,
  ) =>
      ApiSubscriptionRepository(
        source: source,
        client: dio,
      );
}
