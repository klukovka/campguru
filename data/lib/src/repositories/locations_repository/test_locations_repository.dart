import 'dart:math';

import 'package:domain/domain.dart';

class TestLocationsRepository implements LocationsRepository {
  static const _maxLocations = 50;
  static const _images = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Altja_j%C3%B5gi_Lahemaal.jpg/1200px-Altja_j%C3%B5gi_Lahemaal.jpg',
    'https://picjumbo.com/wp-content/uploads/beautiful-nature-mountain-scenery-with-flowers-free-photo.jpg',
    'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?cs=srgb&dl=pexels-james-wheeler-417074.jpg&fm=jpg',
    'https://natureconservancy-h.assetsadobe.com/is/image/content/dam/tnc/nature/en/photos/w/o/WOPA160517_D056-resized.jpg?crop=864%2C0%2C1728%2C2304&wid=600&hei=800&scl=2.88',
    'https://upload.wikimedia.org/wikipedia/commons/3/36/Hopetoun_falls.jpg',
    'https://corporate.walmart.com/content/dam/corporate/images/global-responsibility/sustainability/planet/nature/businessfornature-banner.png',
    'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
    'https://images.squarespace-cdn.com/content/v1/61c4da8eb1b30a201b9669f2/1696691175374-MJY4VWB1KS8NU3DE3JK1/Sounds-of-Nature.jpg',
    'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_640.jpg',
    'https://hips.hearstapps.com/hmg-prod/images/nature-quotes-landscape-1648265299.jpg',
  ];

  @override
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(
    Filter filter,
  ) async {
    int allUploadedLocations = filter.page * filter.size;

    await Future.delayed(const Duration(milliseconds: 1000));

    if (allUploadedLocations >= _maxLocations) {
      return FailureOrResult.success(Chunk(
        fullCount: _maxLocations,
        values: const [],
      ));
    }

    final locations = List.generate(
      filter.size,
      (index) {
        final id = allUploadedLocations + index;
        return Location(
          id: allUploadedLocations + index,
          images: _images.take(Random().nextInt(10) + 1).toList()..shuffle(),
          name: 'Location $id',
          mark: Random().nextDouble() * 5,
          reviewsAmount: Random().nextInt(100),
          isFavorite: Random().nextInt(4) % 2 == 0,
        );
      },
    );

    return FailureOrResult.success(Chunk(
      fullCount: _maxLocations,
      values: locations,
    ));
  }
}
