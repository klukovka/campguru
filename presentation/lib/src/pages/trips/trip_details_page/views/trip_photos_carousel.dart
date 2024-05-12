import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class TripPhotosCarousel extends StatelessWidget {
  final Trip trip;

  const TripPhotosCarousel({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return PhotosInfoCarousel(
      images: [trip.route.mapUrl],
      name: trip.name,
    );
  }
}
