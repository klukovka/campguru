import 'package:domain/domain.dart';

class ApiAuthRepository implements AuthRepository {
  @override
  Future<FailureOrResult<AuthenticationDetails>> refreshToken(
    String refreshToken,
  ) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<AuthenticationDetails>> signUp(NewUser newUser) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
