part of 'app_control_cubit.dart';

class AppControlState extends Equatable {
  final Failure? failue;
  final String? languageCode;

  const AppControlState({
    this.failue,
    this.languageCode,
  });

  Locale get currentLocale {
    final languageCode = this.languageCode ?? '';
    final locale = CampguruLocalizations.supportedLocales
        .firstWhereOrNull((element) => element.languageCode == languageCode);
    return locale ?? CampguruLocalizations.supportedLocales.first;
  }

  AppControlState copyWith({
    ValueGetter<Failure?>? failue,
    String? languageCode,
  }) {
    return AppControlState(
      failue: failue != null ? failue() : this.failue,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  List<Object?> get props => [failue, languageCode];
}
