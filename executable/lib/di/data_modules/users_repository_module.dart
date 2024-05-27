import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UsersRepositoryModule {
  @test
  @lazySingleton
  UsersRepository getTestUsersRepository(TestDataSource dataSource, Dio dio) =>
      ProxyTestUsersRepository(
        dataSource,
        dio,
      );

  @dev
  @prod
  @lazySingleton
  UsersRepository apiUsersRepository(Dio dio) => ApiUsersRepository(dio);
}
