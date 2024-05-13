import 'package:domain/domain.dart';

abstract class CacheRepository {
  Stream<(double progress, bool isCompleted)> saveRoute(Route route);
}
