import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/models/users/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiUsersRepository implements UsersRepository {
  final Dio client;

  ApiUsersRepository(this.client);

  @override
  Future<FailureOrResult<User>> getCurrentUser() async {
    final response = await client.get('/auth/current-user');
    return response.toFailureOrResult(UserDto.fromJson);
  }

  @override
  Future<FailureOrResult<bool>> hasPremium() {
    // TODO: implement hasPremium
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<User>> getUserByEmail(String email) async {
    final response = await client.get('/api/user/email/$email');
    return response.toFailureOrResult(UserDto.fromJson);
  }
}
