import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String name;
  final String surname;
  final Uint8List? photo;
  final DateTime? premiumExpirationDate;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.photo,
    required this.surname,
    this.premiumExpirationDate,
  });

  String get fullname => '$name $surname';

  bool get hasPremium {
    final expirationDate = premiumExpirationDate;

    if (expirationDate == null) return false;
    return DateTime.now().compareTo(expirationDate) < 1;
  }

  @override
  List<Object?> get props => [id, email, name, photo, surname];
}
