import 'package:equatable/equatable.dart';

class NewRoute extends Equatable {
  final List<int> locations;
  final String name;
  final String description;
  final bool isPrivate;
  final List<int> labels;

  NewRoute({
    required this.locations,
    required this.name,
    required this.description,
    required this.isPrivate,
    required this.labels,
  });

  @override
  List<Object> get props => [
        locations,
        name,
        description,
        isPrivate,
        labels,
      ];
}
