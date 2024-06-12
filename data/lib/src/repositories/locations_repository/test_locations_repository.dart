import 'package:data/src/data_source/test_data_source.dart';
import 'package:domain/domain.dart';

class TestLocationsRepository implements LocationsRepository {
  final TestDataSource _dataSource;

  TestLocationsRepository(this._dataSource);

  @override
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(
    Filter filter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return FailureOrResult.success(
      _dataSource.generateLocations(size: filter.size, page: filter.page),
    );
  }

  @override
  Future<FailureOrResult<void>> addLocationToFavorites(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return FailureOrResult.success(null);
  }

  @override
  Future<FailureOrResult<void>> removeLocationFromFavorites(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return FailureOrResult.success(null);
  }

  @override
  Future<FailureOrResult<Location>> getLocationDetails(int id) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return FailureOrResult.success(_dataSource.getLocationDetails(id));
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getRouteLocations(
    int routeId,
    Filter filter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return FailureOrResult.success(
      _dataSource.generateLocations(size: filter.size, page: filter.page),
    );
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getLocationsFilterLabels() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return FailureOrResult.success([
      PremiumBasedFilterLabel(
        id: 0,
        name: FilterLabel.showNearest,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.animals,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 2,
        name: FilterLabel.forest,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 3,
        name: FilterLabel.mountains,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 4,
        name: FilterLabel.nature,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 5,
        name: FilterLabel.river,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 6,
        name: FilterLabel.historical,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 7,
        name: FilterLabel.cultural,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 8,
        name: FilterLabel.hiking,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 9,
        name: FilterLabel.skiing,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 10,
        name: FilterLabel.lakes,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 11,
        name: FilterLabel.waterfall,
        isPremium: true,
      ),
    ]);
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getFavoriteLocations(
    Filter filter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return FailureOrResult.success(
      _dataSource.generateLocations(size: filter.size, page: filter.page),
    );
  }
}
