import 'package:domain/domain.dart';

abstract class UsersRepository {
  Future<FailureOrResult<User>> getCurrentUser();
  Future<FailureOrResult<User>> getUserByEmail(String email);
  Future<FailureOrResult<User>> updateUser(PatchUser patchUser);
}
