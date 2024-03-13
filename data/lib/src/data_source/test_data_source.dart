import 'dart:math';

import 'package:domain/domain.dart';

class TestDataSource {
  static const _maxLocations = 50;
  static const _maxReviews = 50;

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

  Chunk<Location> generateLocations({required int size, required int page}) {
    int allUploadedLocations = page * size;
    if (allUploadedLocations >= _maxLocations) {
      return Chunk(
        fullCount: _maxLocations,
        values: const [],
      );
    }

    final locations = List.generate(
      size,
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

    return Chunk(
      fullCount: _maxLocations,
      values: locations,
    );
  }

  Location getLocationDetails(int id) {
    return Location(
      id: id,
      images: _images,
      name: 'Location $id',
      mark: Random().nextDouble() * 5,
      reviewsAmount: Random().nextInt(100) + 5,
      isFavorite: Random().nextInt(4) % 2 == 0,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      labels: const [
        'Nature',
        'River',
        'Mountains',
        'Forest',
        'Random',
        'Trees',
        'Wildlife',
        'Animals',
      ],
      reviews: generateReviews(size: 5, page: 0).values,
      lat: 50,
      lng: 50,
    );
  }

  Chunk<Review> generateReviews({required int size, required int page}) {
    int allUploadedReviews = page * size;
    if (allUploadedReviews >= _maxReviews) {
      return Chunk(
        fullCount: _maxReviews,
        values: const [],
      );
    }

    final reviews = List.generate(
      size,
      (index) => Review(
        id: index,
        user: User(
          id: index,
          email: 'mock.email@gmail.com',
          name: index % 2 == 0 ? 'Oli Sykes' : 'Chris Motionless',
          photo: index % 2 == 0
              ? 'https://townsquare.media/site/366/files/2022/02/attachment-oli_sykes_bmth_2022_red_carpet_photo.jpg'
              : index % 3 == 0
                  ? null
                  : 'https://pbs.twimg.com/profile_images/1700188099366580224/le9XC-fH_400x400.jpg',
        ),
        mark: Random().nextInt(5).toDouble(),
        review: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                'sed do eiusmod tempor incididunt ut labore et dolore magna '
                'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
                'ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                'Duis aute irure dolor in reprehenderit in voluptate velit '
                'esse cillum dolore eu fugiat nulla pariatur. '
                'Excepteur sint occaecat cupidatat non proident, '
                'sunt in culpa qui officia deserunt mollit anim id est laborum'
            .split('')
            .take(Random().nextInt(300) + 10)
            .join(),
        createdAt: DateTime.now()
            .toUtc()
            .subtract(Duration(days: index + allUploadedReviews)),
        photos: _images.take(index).toList(),
      ),
    );

    return Chunk(fullCount: _maxReviews, values: reviews);
  }
}
