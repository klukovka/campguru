import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

extension ThemeModeExtension on ThemeMode {
  String getTitle(BuildContext context) => switch (this) {
        ThemeMode.system => context.strings.system,
        ThemeMode.light => context.strings.light,
        ThemeMode.dark => context.strings.dark,
      };
}
