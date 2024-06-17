import 'dart:typed_data';

import 'package:domain/domain.dart';
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
    return DateTime.now().toUtc().compareTo(expirationDate) < 1;
  }

  @override
  List<Object?> get props {
    return [
      id,
      email,
      name,
      surname,
      photo,
      premiumExpirationDate,
    ];
  }

  User copyWith({
    int? id,
    String? email,
    String? name,
    String? surname,
    Nullable<Uint8List>? photo,
    Nullable<DateTime>? premiumExpirationDate,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      photo: photo != null ? photo.value : this.photo,
      premiumExpirationDate: premiumExpirationDate != null
          ? premiumExpirationDate.value
          : this.premiumExpirationDate,
    );
  }
}
