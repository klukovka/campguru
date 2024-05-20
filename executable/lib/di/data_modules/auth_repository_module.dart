import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthRepositoryModule {
  @test
  @lazySingleton
  AuthRepository testAuthRepository(Dio dio) => ProxyTestAuthRepository(dio);

  @dev
  @prod
  @lazySingleton
  AuthRepository apiAuthRepository(Dio dio) => ApiAuthRepository(dio);
}
