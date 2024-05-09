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
        id: 1,
        name: FilterLabel.showNearest,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.animals,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.forest,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.mountains,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.nature,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.river,
        isPremium: true,
      ),
    ]);
  }
}
