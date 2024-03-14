import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class Route extends Equatable with TableItem<Route> {
  @override
  final int id;
  final double mark;
  final String mapUrl;
  final double distance;
  final double duration;
  final bool isFavorite;

  Route({
    required this.id,
    required this.mark,
    required this.mapUrl,
    required this.distance,
    required this.duration,
    required this.isFavorite,
  });

  @override
  List<Object> get props {
    return [
      id,
      mark,
      mapUrl,
      distance,
      duration,
      isFavorite,
    ];
  }

  Route copyWith({
    int? id,
    double? mark,
    String? mapUrl,
    double? distance,
    double? duration,
    bool? isFavorite,
  }) {
    return Route(
      id: id ?? this.id,
      mark: mark ?? this.mark,
      mapUrl: mapUrl ?? this.mapUrl,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Route merge(Route another) => copyWith(
        id: another.id,
        mark: another.mark,
        mapUrl: another.mapUrl,
        distance: another.distance,
        duration: another.duration,
        isFavorite: another.isFavorite,
      );
}
