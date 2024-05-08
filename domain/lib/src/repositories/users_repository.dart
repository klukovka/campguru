import 'package:domain/domain.dart';

abstract class UsersRepository {
  Future<FailureOrResult<User>> getCurrentUser();
  Future<FailureOrResult<bool>> hasPremium();
}
