import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthRepositoryModule {
  @test
  @lazySingleton
  AuthRepository getTestAuthRepository() => TestAuthRepository();
}
