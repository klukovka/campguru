import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:domain/domain.dart';

class TestDataSource {
  final DeviceInfoPlugin deviceInfoPlugin;
  static const _maxLocations = 50;
  static const _maxReviews = 50;
  static const _maxTrips = 40;

  static const _map =
      'https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyA3kg7YWugGl1lTXmAmaBGPNhDW9pEh5bo&signature=GJnbP6sQrFY1ce8IsvG2WR2P0Jw=';

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

  TestDataSource(this.deviceInfoPlugin);

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
          lat: 34,
          lng: 23,
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
        FilterLabel.nature,
        FilterLabel.river,
        FilterLabel.mountains,
        FilterLabel.forest,
      ],
      reviews: generateReviews(size: 5, page: 1).values,
      lat: 49.09,
      lng: 35.52,
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
        user: generateUser(index),
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
        photos: const [],
      ),
    );

    return Chunk(fullCount: _maxReviews, values: reviews);
  }

  Chunk<Route> generateRoutes({required int size, required int page}) {
    int allUploadedLocations = page * size;
    if (allUploadedLocations >= _maxLocations) {
      return Chunk(
        fullCount: _maxLocations,
        values: const [],
      );
    }

    final routes = List.generate(
      size,
      (index) {
        final id = allUploadedLocations + index;
        return Route(
          id: allUploadedLocations + index,
          name: 'Route $id',
          mark: Random().nextDouble() * 5,
          reviewsAmount: Random().nextInt(100),
          isFavorite: Random().nextInt(4) % 2 == 0,
          mapUrl: _map,
          distance: Random().nextDouble() * 5000,
          duration: Random().nextDouble() * 5,
          isMine: Random().nextInt(4) % 2 == 0,
        );
      },
    );

    return Chunk(
      fullCount: _maxLocations,
      values: routes,
    );
  }

  Route getRouteDetails(int id) {
    return Route(
      id: id,
      name: 'Route $id',
      mark: Random().nextDouble() * 5,
      reviewsAmount: Random().nextInt(100),
      isFavorite: Random().nextInt(4) % 2 == 0,
      mapUrl: _map,
      distance: Random().nextDouble() * 5000,
      duration: Random().nextDouble() * 5,
      isMine: Random().nextInt(4) % 2 == 0,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      labels: const [
        FilterLabel.nature,
        FilterLabel.river,
        FilterLabel.mountains,
        FilterLabel.forest,
        FilterLabel.animals,
        FilterLabel.hasInternet,
      ],
      reviews: generateReviews(size: 5, page: 1).values,
      locationsAmount: 3,
      polyline: const [
        LatLng(49.096619, 35.528852),
        LatLng(49.098140, 35.524775),
        LatLng(49.092551, 35.526930),
        LatLng(49.091879, 35.528083),
      ],
      locations: const [
        LatLng(49.096619, 35.528852),
        LatLng(49.098140, 35.524775),
        LatLng(49.092551, 35.526930),
        LatLng(49.091879, 35.528083),
      ],
    );
  }

  Future<User> getCurrentUser() async {
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final device =
        (deviceInfo.data['name']?.toString() ?? '').replaceAll(' ', '');
    return User(
      id: 1000,
      email: 'noah.sebastian+$device@badomens.io',
      name: 'Noah',
      surname: 'Sebastian',
    );
  }

  List<User> generateUsers(int size) => List.generate(
        size,
        (index) => generateUser(index),
      );

  User generateUser(int index) {
    return User(
      id: index,
      email: 'mock.email+$index@gmail.com',
      name: index % 2 == 0 ? 'Oli' : 'Chris',
      surname: index % 2 == 0 ? 'Sykes' : 'Motionless',
    );
  }

  Chunk<Trip> generateTrips({required int size, required int page}) {
    int allUploadedTrips = page * size;
    if (allUploadedTrips >= _maxTrips) {
      return Chunk(
        fullCount: _maxTrips,
        values: const [],
      );
    }

    final trips = List.generate(
      size,
      (index) {
        final id = allUploadedTrips + index;
        final completed = index & 2 == 0;
        return Trip(
          id: allUploadedTrips + index,
          name: 'Trip $id',
          date: completed
              ? DateTime.now().subtract(Duration(days: index))
              : DateTime.now().add(Duration(days: index)),
          completed: completed,
          route: getRouteDetails(id),
          users: [],
          usersAmount: 4,
        );
      },
    );

    return Chunk(
      fullCount: _maxTrips,
      values: trips,
    );
  }

  Future<Trip> getTripDetails(int id) async {
    final completed = id & 2 == 0;
    return Trip(
      id: id,
      name: 'Trip $id',
      date: completed
          ? DateTime.now().subtract(Duration(days: id))
          : DateTime.now().add(Duration(days: id)),
      completed: completed,
      route: getRouteDetails(id),
      users: [
        await getCurrentUser(),
        ...generateUsers(4),
      ],
      usersAmount: 4,
    );
  }
}
