import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class NewUser extends Equatable {
  final String email;
  final String password;
  final String name;
  final String surname;
  final Uint8List? photo;

  NewUser({
    required this.email,
    required this.password,
    required this.name,
    required this.photo,
    required this.surname,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        name,
        photo,
        surname,
      ];
}
