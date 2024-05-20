import 'package:domain/domain.dart';

class TestAuthRepository implements AuthRepository {
  @override
  Future<FailureOrResult<AuthenticationDetails>> refreshToken(
    String refreshToken,
  ) async =>
      FailureOrResult.success(
        const AuthenticationDetails(
          userId: 1,
          accessJwtToken: 'accessJwtToken',
          refreshJwtToken: 'refreshJwtToken',
        ),
      );

  @override
  Future<FailureOrResult<AuthenticationDetails>> signUp(NewUser newUser) async {
    return FailureOrResult.success(
      const AuthenticationDetails(
        userId: 1,
        accessJwtToken: 'accessJwtToken',
        refreshJwtToken: 'refreshJwtToken',
      ),
    );
  }
}
