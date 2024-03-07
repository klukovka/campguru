import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<FailureOrResult<AuthenticationDetails>> refreshToken(
    String refreshToken,
  );
}
