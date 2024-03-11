import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/config/di/get_it_data.dart';

class CampguruApp extends StatelessWidget {
  final GetIt locator;

  const CampguruApp({
    super.key,
    required this.locator,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppAutoRouter>();

    final themeExtensions = [
      FavoriteButtonThemeData(
        icon: MdiIcons.heartOutline,
        selectedIcon: MdiIcons.heart,
      ),
    ];

    return GetItData(
      locator: locator,
      child: MaterialApp.router(
        theme: FlexThemeData.light(
          scheme: FlexScheme.materialBaseline,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 20,
          appBarStyle: FlexAppBarStyle.primary,
          appBarElevation: 9.5,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            defaultRadius: 12.0,
            textButtonRadius: 20.0,
            filledButtonRadius: 20.0,
            elevatedButtonRadius: 20.0,
            outlinedButtonRadius: 20.0,
            outlinedButtonBorderWidth: 2.0,
            outlinedButtonPressedBorderWidth: 3.5,
            toggleButtonsRadius: 24.0,
            toggleButtonsBorderWidth: 2.5,
            inputDecoratorRadius: 20.0,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
            snackBarRadius: 10,
            bottomSheetRadius: 32.0,
          ),
          useMaterial3ErrorColors: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.rubik().fontFamily,
          extensions: themeExtensions,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.materialBaseline,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 12,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            defaultRadius: 12.0,
            textButtonRadius: 20.0,
            filledButtonRadius: 20.0,
            elevatedButtonRadius: 20.0,
            outlinedButtonRadius: 20.0,
            outlinedButtonBorderWidth: 2.0,
            outlinedButtonPressedBorderWidth: 3.5,
            toggleButtonsRadius: 24.0,
            toggleButtonsBorderWidth: 2.5,
            inputDecoratorRadius: 20.0,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
            snackBarRadius: 10,
            bottomSheetRadius: 32.0,
          ),
          useMaterial3ErrorColors: true,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          fontFamily: GoogleFonts.rubik().fontFamily,
          extensions: themeExtensions,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouter.defaultRouteParser(),
        routeInformationProvider: appRouter.routeInfoProvider(),
        routerDelegate: appRouter.delegate(
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
      ),
    );
  }
}
