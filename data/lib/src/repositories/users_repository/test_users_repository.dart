import 'package:domain/domain.dart';

class TestUsersRepository implements UsersRepository {
  @override
  Future<FailureOrResult<User>> getCurrentUser() async =>
      FailureOrResult.success(
        User(
          id: 1,
          email: 'noah.sebastian@badomens.io',
          name: 'Noah Sebastian',
          photo: 'https://pbs.twimg.com/media/GBpiaxpWwAA9dXw.jpg',
        ),
      );
}
