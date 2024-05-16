import 'package:domain/domain.dart';

class GetCachedRoutesUseCase {
  final CacheRepository cacheRepository;
  final RoutesOutputPort routesOutputPort;

  GetCachedRoutesUseCase({
    required this.cacheRepository,
    required this.routesOutputPort,
  });

  Future<void> call({String searchQuery = ''}) async {
    routesOutputPort.setCachedRoutesFilter(searchQuery);
    final routes = cacheRepository.getCachedRoutes(
      searchQuery: searchQuery,
    );

    routesOutputPort.updateCachedRoutes(routes);
  }
}
