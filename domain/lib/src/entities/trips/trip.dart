import 'package:domain/domain.dart';

class Trip {
  final int id;
  final String name;
  final DateTime date;
  final bool completed;
  final Route route;
  final List<User>? users;

  Trip({
    required this.id,
    required this.name,
    required this.date,
    required this.completed,
    required this.route,
    required this.users,
  });

  Trip copyWith({
    int? id,
    String? name,
    DateTime? date,
    bool? completed,
    Route? route,
    List<User>? users,
  }) {
    return Trip(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      completed: completed ?? this.completed,
      route: route ?? this.route,
      users: users ?? this.users,
    );
  }
}
