import 'package:domain/domain.dart';

abstract class CacheRepository {
  Stream<double> saveRoute(Route route);
}
