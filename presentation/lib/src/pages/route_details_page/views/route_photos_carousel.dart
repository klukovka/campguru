import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';

class RoutePhotosCarousel extends StatelessWidget {
  final domain.Route route;

  const RoutePhotosCarousel({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return PhotosInfoCarousel(
      images: [route.mapUrl],
      name: route.name,
      mark: route.mark,
    );
  }
}
