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
  Future<FailureOrResult<bool>> hasPremium() async => FailureOrResult.success(
        false,
      );
}
