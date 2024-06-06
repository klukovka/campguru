import 'package:intl/intl.dart' as intl;

import 'localizations.dart';

/// The translations for Ukrainian (`uk`).
class CampguruLocalizationsUk extends CampguruLocalizations {
  CampguruLocalizationsUk([super.locale = 'uk']);

  @override
  String get languageName => 'Українська';

  @override
  String get appName => 'Camp-Guru';

  @override
  String get reset => 'Скинути';

  @override
  String get apply => 'Застосувати';

  @override
  String get caching => 'Кешування';

  @override
  String get notAvailable => 'Недоступно';

  @override
  String get close => 'Закрити';

  @override
  String get routes => 'Маршрути';

  @override
  String get trips => 'Походи';

  @override
  String get profile => 'Профіль';

  @override
  String get locations => 'Локації';

  @override
  String get rating => 'Рейтинг';

  @override
  String get reviews => 'Відгуки';

  @override
  String get date => 'Дата';

  @override
  String get distance => 'Відстань';

  @override
  String get users => 'Користувачі';

  @override
  String get createTrip => 'Створити похід';

  @override
  String get title => 'Назва';

  @override
  String get route => 'Маршрут';

  @override
  String get titleRequired => 'Назва обов\'язкова.';

  @override
  String get enterUserEmail => 'Введіть електронну пошту користувача';

  @override
  String get selectAtLeastOneUser => 'Виберіть принаймні 1 користувача.';

  @override
  String get routeRequired => 'Маршрут обов\'язковий.';

  @override
  String get dateRequired => 'Дата обов\'язкова.';

  @override
  String get save => 'Зберегти';

  @override
  String get createRoute => 'Створити маршрут';

  @override
  String get selectAtLeastTwoLocations => 'Виберіть принаймні 2 локації.';

  @override
  String get fieldRequired => 'Поле обов\'язкове.';

  @override
  String get name => 'Ім\'я';

  @override
  String get description => 'Опис';

  @override
  String get private => 'Приватний';

  @override
  String get signUp => 'Зареєструватися';

  @override
  String get surname => 'Прізвище';

  @override
  String get emailAddressRequired => 'Електронна адреса обов\'язкова.';

  @override
  String get emailMustBeValid => 'Електронна адреса має бути дійсною.';

  @override
  String get email => 'Електронна пошта';

  @override
  String get passwordRequired => 'Пароль обов\'язковий.';

  @override
  String get passwordRequirements =>
      'Пароль повинен містити щонайменше 8 символів, поєднуючи малі та великі літери, цифри та символи.';

  @override
  String get passwordTooSimple => 'Пароль занадто простий';

  @override
  String get passwordsNotMatch => 'Паролі не збігаються.';

  @override
  String get complete => 'Завершити';

  @override
  String get password => 'Пароль';

  @override
  String get login => 'Увійти';

  @override
  String get editProfile => 'Редагувати профіль';

  @override
  String get subscription => 'Підписка';

  @override
  String get favoriteLocations => 'Улюблені локації';

  @override
  String get myRoutes => 'Мої маршрути';

  @override
  String get touristTips => 'Туристичні поради';

  @override
  String get language => 'Мова';

  @override
  String get theme => 'Тема';

  @override
  String get logout => 'Вийти';

  @override
  String get version => 'Версія';

  @override
  String get viewOnMap => 'Переглянути на карті';

  @override
  String get filters => 'Фільтри';

  @override
  String get sortBy => 'Сортувати за';

  @override
  String get filterBy => 'Фільтрувати за';

  @override
  String get onlyThreeFiltersSimultaneously =>
      '* користувачі без підписки можуть обрати лише 3 фільтри одночасно';

  @override
  String get premium => 'преміум';

  @override
  String get distanceMertes => 'Відстань (м)';

  @override
  String get onlyForUsersWithSubscription =>
      '* доступно лише для користувачів з підпискою';

  @override
  String amountReviews(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    String temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      many: '$amountString Відгуків',
      few: '$amountString Відгуки',
      other: '$amountString Відгуки',
      one: '$amountString Відгук',
    );
    return temp0;
  }

  @override
  String reviewsAmount(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Відгуки ($amountString)';
  }

  @override
  String get more => 'Більше';

  @override
  String get km => 'км';

  @override
  String get h => 'год';

  @override
  String get favorites => 'Вибране';

  @override
  String get cached => 'Закешоване';

  @override
  String get myOwn => 'Мої';

  @override
  String locationsAmount(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Локації ($amountString)';
  }

  @override
  String get cache => 'Кеш';

  @override
  String get forgotPassword => 'Забули пароль?';

  @override
  String get dontHaveAccount => 'Ще не маєте облікового запису?';

  @override
  String get registerNow => 'Зареєструйтесь зараз!';

  @override
  String get chat => 'Чат';

  @override
  String usersAmount(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Користувачі ($amountString)';
  }

  @override
  String amountUsers(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    String temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      many: '$amountString Користувачів',
      few: '$amountString Користувачі',
      other: '$amountString Користувачі',
      one: '$amountString Користувач',
    );
    return temp0;
  }

  @override
  String get completed => 'Завершено';

  @override
  String get uncompleted => 'Незавершено';

  @override
  String get noInternetConnectionError => 'Відсутнє підключення до Інтернету';

  @override
  String get generalMobileError => 'Виникла помилка мобільного додатка!';

  @override
  String get serverErrorOccured => 'Виникла помилка сервера!';

  @override
  String get toSaveMoreRoutesBuyPremiumError =>
      'Купіть преміум, щоб зберегти більше маршрутів!';

  @override
  String get geolocatorServiceDisabledError => 'Сервіс геолокації вимкнено.';

  @override
  String get permissionDeniedError =>
      'Дозвіл відхилено. Будь ласка, увімкніть його в налаштуваннях телефону.';

  @override
  String get permissionDeniedForeverError =>
      'Дозвіл відхилено назавжди. Будь ласка, увімкніть його в налаштуваннях телефону.';

  @override
  String get today => 'Сьогодні';

  @override
  String get yesterday => 'Вчора';

  @override
  String get showNearest => 'Показати найближчі';

  @override
  String get nature => 'Природа';

  @override
  String get river => 'Річка';

  @override
  String get mountains => 'Гори';

  @override
  String get forest => 'Ліс';

  @override
  String get animals => 'Тварини';

  @override
  String get hasInternet => 'Є Інтернет';

  @override
  String get cafe => 'Кафе';

  @override
  String get wc => 'Туалет';

  @override
  String get showUncompleted => 'Показати незавершені';

  @override
  String get searchLocations => 'Шукати локації';

  @override
  String get searchRoutes => 'Шукати маршрути';

  @override
  String get searchTrips => 'Шукати поїздки';

  @override
  String get english => 'English';

  @override
  String get ukrainian => 'Українська';

  @override
  String get system => 'Системна';

  @override
  String get light => 'Світла';

  @override
  String get dark => 'Темна';

  @override
  String get monthly => 'Місячна';

  @override
  String get yearly => 'Річна';
}
