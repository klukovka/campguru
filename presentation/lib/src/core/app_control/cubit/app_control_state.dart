part of 'app_control_cubit.dart';

class AppControlState extends Equatable {
  final Failure? failue;
  final String? languageCode;
  final String? themeMode;

  const AppControlState({
    this.failue,
    this.languageCode,
    this.themeMode,
  });

  Locale get currentLocale {
    final languageCode = this.languageCode ?? '';
    final locale = CampguruLocalizations.supportedLocales
        .firstWhereOrNull((element) => element.languageCode == languageCode);
    return locale ?? CampguruLocalizations.supportedLocales.first;
  }

  ThemeMode get theme {
    return ThemeMode.values
            .firstWhereOrNull((element) => element.name == themeMode) ??
        ThemeMode.system;
  }

  AppControlState copyWith({
    ValueGetter<Failure?>? failue,
    String? languageCode,
    String? themeMode,
  }) {
    return AppControlState(
      failue: failue != null ? failue() : this.failue,
      languageCode: languageCode ?? this.languageCode,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [failue, languageCode, themeMode];
}
