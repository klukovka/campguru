import 'package:domain/domain.dart';

class LogoutUseCase {
  final PreferencesRepository preferencesRepository;
  final CacheRepository cacheRepository;

  LogoutUseCase({
    required this.preferencesRepository,
    required this.cacheRepository,
  });

  void call() async {
    preferencesRepository.clearTokens();
    cacheRepository.clearRoutes();
  }
}
