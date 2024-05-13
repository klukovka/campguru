import 'package:data/data.dart';
import 'package:data/src/models/routes/route_hive_dto.dart';
import 'package:domain/domain.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart' as latlong;

class CacheFlutterMapRepository implements CacheRepository {
  final HiveDataSource _dataSource;

  CacheFlutterMapRepository(this._dataSource);

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
        options: TileLayer(),
      ),
    );

    yield* progress.map((event) => (
          event.percentageProgress,
          event.isComplete,
        ));
  }
}
