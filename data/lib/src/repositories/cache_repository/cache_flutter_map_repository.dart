import 'dart:developer';

import 'package:data/data.dart';
import 'package:data/src/models/routes/route_hive_dto.dart';
import 'package:domain/domain.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart' as latlong;

class CacheFlutterMapRepository implements CacheRepository {
  final HiveDataSource _dataSource;

  CacheFlutterMapRepository._(this._dataSource);

  static Future<CacheFlutterMapRepository> getInstance(
    HiveDataSource dataSource,
  ) async {
    try {
      await FMTCObjectBoxBackend().initialise();
    } catch (e, st) {
      log(
        'FMTCObjectBoxBackend initialization failed',
        error: e,
        stackTrace: st,
      );
    }

    return CacheFlutterMapRepository._(dataSource);
  }

  @override
  Stream<(double progress, bool isCompleted)> saveRoute(Route route) async* {
    await _dataSource.saveRoute(RouteHiveDto.fromDomain(route));
    final store = FMTCStore('Route${route.id}');
    await store.manage.create();
    final region = CustomPolygonRegion(
      (route.polyline ?? [])
          .map((e) => latlong.LatLng(e.latitude, e.longitude))
          .toList(),
    );
    final progress = store.download.startForeground(
      region: region.toDownloadable(
        minZoom: 1,
        maxZoom: 20,
        options: TileLayer(
          userAgentPackageName: 'com.example.campguru',
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
      ),
    );

    yield* progress.map((event) => (
          event.percentageProgress,
          event.isComplete,
        ));
  }

  @override
  List<Route> getCachedRoutes({String searchQuery = ''}) => _dataSource
      .getCachedRoutes()
      .map((e) => e.toDomain())
      .where((element) =>
          element.name.toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();

  @override
  Future<FailureOrResult<void>> deleteRoute(int routeId) async {
    try {
      final store = FMTCStore('Route$routeId');
      await store.manage.delete();
      await _dataSource.deleteRoute(routeId);
      return FailureOrResult.success(null);
    } catch (e) {
      return FailureOrResult.failure(ApplicationFailure(
        type: ApplicationErrorType.general,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<FailureOrResult<void>> clearRoutes() async {
    final routes = getCachedRoutes();
    final results = await Future.wait(routes.map((e) => deleteRoute(e.id)));
    final failure = results.firstWhereOrNull((element) => element.hasFailed);
    if (failure != null) return failure;
    return FailureOrResult.success(null);
  }

  @override
  Route getRoute(int id) => _dataSource.getRoute(id)!.toDomain();
}
