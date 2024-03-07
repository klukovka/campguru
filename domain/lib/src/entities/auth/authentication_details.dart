import 'package:equatable/equatable.dart';

class AuthenticationDetails extends Equatable {
  final int userId;
  final String accessJwtToken;
  final String refreshJwtToken;

  const AuthenticationDetails({
    required this.userId,
    required this.accessJwtToken,
    required this.refreshJwtToken,
  });

  @override
  List<Object?> get props {
    return [
      userId,
      accessJwtToken,
      refreshJwtToken,
    ];
  }
}
