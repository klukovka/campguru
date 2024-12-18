import 'package:components/components.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/pages/home_page/home_page_tab_type.dart';

final themeExtensions = <ThemeExtension<dynamic>>[
  FavoriteButtonThemeData(
    icon: MdiIcons.heartOutline,
    selectedIcon: MdiIcons.heart,
  ),
  FilterButtonThemeData(
    icon: MdiIcons.filterOutline,
    selectedIcon: MdiIcons.filter,
  ),
  SearchFieldThemeData(
    magnify: MdiIcons.magnify,
    clear: MdiIcons.closeCircle,
  ),
  CircleIconPreviewThemeData(
    user: HomePageTabType.profile.iconData,
  ),
  AvatarThemeData(
    defaultIcon: HomePageTabType.profile.iconData,
  ),
  MapThemeData(
    mapMarker: MdiIcons.mapMarker,
    humanMarker: MdiIcons.human,
  ),
];

final lightTheme = FlexThemeData.light(
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
);

final darkTheme = FlexThemeData.dark(
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
);
