import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/config/di/get_it_data.dart';
import 'package:presentation/src/config/theme/app_theme.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
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

    return GetItData(
      locator: locator,
      child: SkeletonizerConfig(
        data: const SkeletonizerConfigData(),
        child: BlocProvider.value(
          value: locator<AppControlCubit>(),
          child: BlocBuilder<AppControlCubit, AppControlState>(
            builder: (context, state) => MaterialApp.router(
              localizationsDelegates:
                  CampguruLocalizations.localizationsDelegates,
              supportedLocales: CampguruLocalizations.supportedLocales,
              locale: state.currentLocale,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.theme,
              debugShowCheckedModeBanner: false,
              routeInformationParser: appRouter.defaultRouteParser(),
              routeInformationProvider: appRouter.routeInfoProvider(),
              routerDelegate: appRouter.delegate(
                navigatorObservers: () => [
                  AutoRouteObserver(),
                ],
              ),
              builder: (context, child) {
                return BlocListener<AppControlCubit, AppControlState>(
                  listener: (context, state) {
                    if (state.failue != null) {
                      context.showError(state.failue!);
                    }
                  },
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
