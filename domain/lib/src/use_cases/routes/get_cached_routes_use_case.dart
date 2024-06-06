import 'package:domain/domain.dart';

class GetCachedRoutesUseCase {
  final UsersRepository usersRepository;
  final CacheRepository cacheRepository;
  final RoutesOutputPort routesOutputPort;

  GetCachedRoutesUseCase({
    required this.cacheRepository,
    required this.routesOutputPort,
    required this.usersRepository,
  });

  Future<void> call({String searchQuery = ''}) async {
    final user = await usersRepository.getCurrentUser();
    routesOutputPort.setCachedRoutesSearchQuery(searchQuery);
    final routes = cacheRepository.getCachedRoutes(
      searchQuery: searchQuery,
    );

    final hasPremium = user.result?.hasPremium ?? true;

    routesOutputPort.updateCachedRoutes(
      hasPremium ? routes : routes.take(3).toList(),
    );
  }
}
