import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class LocationPhotosCarousel extends StatelessWidget {
  final Location location;

  const LocationPhotosCarousel({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return PhotosInfoCarousel(
      images: location.images,
      name: location.name,
      mark: location.mark,
    );
  }
}
