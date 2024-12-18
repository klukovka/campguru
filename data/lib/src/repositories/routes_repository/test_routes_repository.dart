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
        id: 0,
        name: FilterLabel.animals,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 1,
        name: FilterLabel.forest,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 2,
        name: FilterLabel.mountains,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 3,
        name: FilterLabel.nature,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 4,
        name: FilterLabel.river,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 5,
        name: FilterLabel.hasInternet,
        isPremium: true,
      ),
      PremiumBasedFilterLabel(
        id: 6,
        name: FilterLabel.cafe,
        isPremium: false,
      ),
      PremiumBasedFilterLabel(
        id: 7,
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
  Future<FailureOrResult<RoutePreview>> getRoutePreview(
      List<int> locations) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      RoutePreview(mapUrl: _dataSource.getRouteDetails(100).mapUrl),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getFavoriteRoutes(Filter filter) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      _dataSource.generateRoutes(
        size: filter.size,
        page: filter.page,
      ),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getMyOwnRoutes(Filter filter) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      _dataSource.generateRoutes(
        size: filter.size,
        page: filter.page,
      ),
    );
  }
}
