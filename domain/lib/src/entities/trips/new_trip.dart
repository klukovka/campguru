import 'package:domain/domain.dart';

class NewTrip {
  final List<User> users;
  final Route route;
  final String title;
  final DateTime date;

  NewTrip({
    required this.users,
    required this.route,
    required this.date,
    required this.title,
  });
}
