import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String name;
  final String surname;
  final String? photo;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.photo,
    required this.surname,
  });

  String get fullname => '$name $surname';

  @override
  List<Object?> get props => [id, email, name, photo, surname];
}
