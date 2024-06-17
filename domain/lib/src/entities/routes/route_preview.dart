import 'package:equatable/equatable.dart';

class RoutePreview extends Equatable {
  final String mapUrl;

  RoutePreview({required this.mapUrl});

  @override
  List<Object> get props => [mapUrl];
}
