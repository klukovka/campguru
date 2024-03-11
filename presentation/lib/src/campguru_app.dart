import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/config/di/get_it_data.dart';
import 'package:presentation/src/config/theme/app_theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CampguruApp extends StatelessWidget {
  final GetIt locator;

  const CampguruApp({
    super.key,
    required this.locator,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppAutoRouter>();

    const themeMode = ThemeMode.dark;

    return GetItData(
      locator: locator,
      child: SkeletonizerConfig(
        data: const SkeletonizerConfigData(),
        child: MaterialApp.router(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          routeInformationParser: appRouter.defaultRouteParser(),
          routeInformationProvider: appRouter.routeInfoProvider(),
          routerDelegate: appRouter.delegate(
            navigatorObservers: () => [
              AutoRouteObserver(),
            ],
          ),
        ),
      ),
    );
  }
}
