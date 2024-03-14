import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class Route extends Equatable with TableItem<Route> {
  @override
  final int id;
  final String name;
  final double mark;
  final String mapUrl;
  final double distance;
  final double duration;
  final int reviewsAmount;
  final bool isFavorite;

  Route({
    required this.id,
    required this.name,
    required this.mark,
    required this.mapUrl,
    required this.distance,
    required this.duration,
    required this.isFavorite,
    required this.reviewsAmount,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      mark,
      mapUrl,
      distance,
      duration,
      isFavorite,
      reviewsAmount,
    ];
  }

  Route copyWith({
    int? id,
    double? mark,
    String? mapUrl,
    String? name,
    double? distance,
    double? duration,
    bool? isFavorite,
    int? reviewsAmount,
  }) {
    return Route(
      id: id ?? this.id,
      name: name ?? this.name,
      mark: mark ?? this.mark,
      mapUrl: mapUrl ?? this.mapUrl,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      isFavorite: isFavorite ?? this.isFavorite,
      reviewsAmount: reviewsAmount ?? this.reviewsAmount,
    );
  }

  @override
  Route merge(Route another) => copyWith(
        id: another.id,
        name: another.name,
        mark: another.mark,
        mapUrl: another.mapUrl,
        distance: another.distance,
        duration: another.duration,
        isFavorite: another.isFavorite,
        reviewsAmount: another.reviewsAmount,
      );
}
