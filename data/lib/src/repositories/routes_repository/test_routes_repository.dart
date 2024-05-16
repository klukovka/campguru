import 'package:data/data.dart';
import 'package:domain/domain.dart';

class TestRoutesRepository extends RoutesRepository {
  final TestDataSource _dataSource;

  TestRoutesRepository(this._dataSource);

  @override
  Future<FailureOrResult<void>> addRouteToFavorites(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return FailureOrResult.success(null);
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getAllRoutes(Filter filter) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      _dataSource.generateRoutes(
        size: filter.size,
        page: filter.page,
      ),
    );
  }

  @override
  Future<FailureOrResult<Route>> getRouteDetails(int id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(_dataSource.getRouteDetails(id));
  }

  @override
  Future<FailureOrResult<void>> removeRouteFromFavorites(int id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return FailureOrResult.success(null);
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getRoutesFilterLabels() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return FailureOrResult.success([
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
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.hasInternet,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.cafe,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.wc,
        isPremium: true,
      ),
    ]);
  }

  @override
  Future<FailureOrResult<Route>> createRoute(NewRoute newRoute) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(_dataSource.getRouteDetails(100));
  }

  @override
  Future<FailureOrResult<String>> getRoutePreview(List<LatLng> points) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      _dataSource.getRouteDetails(100).mapUrl,
    );
  }
}
