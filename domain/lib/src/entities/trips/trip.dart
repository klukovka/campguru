import 'package:domain/domain.dart';

class Trip with TableItem<Trip> {
  @override
  final int id;
  final String name;
  final DateTime date;
  final bool completed;
  final Route route;
  final int usersAmount;
  final List<User>? users;

  Trip({
    required this.id,
    required this.name,
    required this.date,
    required this.completed,
    required this.route,
    required this.users,
    required this.usersAmount,
  });

  Trip copyWith({
    int? id,
    String? name,
    DateTime? date,
    bool? completed,
    Route? route,
    List<User>? users,
    int? usersAmount,
  }) {
    return Trip(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      completed: completed ?? this.completed,
      route: route ?? this.route,
      users: users ?? this.users,
      usersAmount: usersAmount ?? this.usersAmount,
    );
  }

  @override
  Trip merge(Trip another) => copyWith(
        id: another.id,
        name: another.name,
        date: another.date,
        completed: another.completed,
        route: another.route,
        users: another.users,
        usersAmount: another.usersAmount,
      );
}
