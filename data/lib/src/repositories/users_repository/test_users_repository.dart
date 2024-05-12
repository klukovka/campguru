import 'package:domain/domain.dart';

class TestUsersRepository implements UsersRepository {
  @override
  Future<FailureOrResult<User>> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return FailureOrResult.success(
      const User(
        id: 1,
        email: 'noah.sebastian@badomens.io',
        name: 'Noah Sebastian',
        photo: 'https://pbs.twimg.com/media/GBpiaxpWwAA9dXw.jpg',
      ),
    );
  }

  @override
  Future<FailureOrResult<bool>> hasPremium() async => FailureOrResult.success(
        false,
      );
}
