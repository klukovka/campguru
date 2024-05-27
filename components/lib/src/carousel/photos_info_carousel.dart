import 'package:components/components.dart';
import 'package:flutter/material.dart';

class PhotosInfoCarousel extends StatelessWidget {
  final List<String> images;
  final String name;
  final double? mark;

  const PhotosInfoCarousel({
    super.key,
    required this.images,
    required this.name,
    this.mark,
  });

  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.sizeOf(context).width;
    return Carousel.builder(
      itemCount: images.length,
      itemBuilder: (index) => SkeletonReplacement(
        borderRadius: BorderRadius.zero,
        child: CustomNetworkImage(
          imageUrl: images[index],
        ),
      ),
      decorator: CarouselDecorator(
        itemConstraints: BoxConstraints.tightFor(
          width: dimension,
          height: dimension,
        ),
      ),
      builder: (context, carousel, points) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Theme.of(context).colorScheme.onPrimary,
            child: carousel,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                points,
                const SizedBox(height: 12),
                RatingNameInfoBar(name: name, mark: mark),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
