import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GeopositionRepositoryModule {
  @lazySingleton
  GeopositionRepository get geopositionRepository =>
      GeolocatorGeopositionRepository();
}
