import 'package:data/data.dart';
import 'package:domain/domain.dart';

class TestUsersRepository implements UsersRepository {
  final TestDataSource _dataSource;

  TestUsersRepository(this._dataSource);

  @override
  Future<FailureOrResult<User>> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    final user = await _dataSource.getCurrentUser();
    return FailureOrResult.success(
      user,
    );
  }

  @override
  Future<FailureOrResult<User>> getUserByEmail(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    final user = _dataSource.generateUser(email.length);
    return FailureOrResult.success(
      User(
        id: user.id,
        email: email,
        name: user.name,
        surname: user.surname,
      ),
    );
  }

  @override
  Future<FailureOrResult<User>> updateUser(PatchUser patchUser) async {
    await Future.delayed(const Duration(seconds: 1));
    return FailureOrResult.failure(ApplicationFailure(
      type: ApplicationErrorType.general,
    ));
  }
}
