import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<FailureOrResult<AuthenticationDetails>> refreshToken(
    String refreshToken,
  );

  Future<FailureOrResult<AuthenticationDetails>> signUp(NewUser newUser);

  Future<FailureOrResult<AuthenticationDetails>> login(LoginUser loginUser);

  Future<FailureOrResult<void>> resetPassword(String email);

  Future<FailureOrResult<void>> changePassword(PatchPassword patchPassword);
}
