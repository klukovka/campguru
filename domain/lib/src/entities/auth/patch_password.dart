import 'package:equatable/equatable.dart';

class PatchPassword extends Equatable {
  final String oldPassword;
  final String newPassword;

  PatchPassword({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [oldPassword, newPassword];
}
