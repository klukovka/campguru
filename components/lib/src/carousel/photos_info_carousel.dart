import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhotosInfoCarousel extends StatelessWidget {
  final List<String> images;
  final String name;
  final double mark;

  const PhotosInfoCarousel({
    super.key,
    required this.images,
    required this.name,
    required this.mark,
  });

  @override
  Widget build(BuildContext context) {
    return Carousel.builder(
      itemCount: images.length,
      itemBuilder: (index) => Image.network(
        images[index],
        fit: BoxFit.cover,
      ),
      decorator: CarouselDecorator(
        itemConstraints: BoxConstraints.tightFor(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width,
        ),
      ),
      builder: (context, carousel, points) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          carousel,
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
