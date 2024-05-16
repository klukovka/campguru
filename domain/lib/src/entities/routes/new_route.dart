import 'package:equatable/equatable.dart';

class NewRoute extends Equatable {
  final List<int> locations;
  final String name;
  final String description;
  final bool isPrivate;

  NewRoute({
    required this.locations,
    required this.name,
    required this.description,
    required this.isPrivate,
  });

  @override
  List<Object> get props => [locations, name, description, isPrivate];
}
