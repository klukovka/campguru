import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class ControllersModule {
  @lazySingleton
  SplashPageController getSplashPageController(
    IsAuthorizedUseCase isAuthorizedUseCase,
    GetAllLocationsUseCase getAllLocationsUseCase,
    GetAllRoutesUseCase getAllRoutesUseCase,
    GetLocationsAvailableFiltersUseCase getLocationsAvailableFiltersUseCase,
    GetRoutesAvailableFiltersUseCase getRoutesAvailableFiltersUseCase,
    GetAppVersion getAppVersion,
    GetTripsUseCase getAllTripsUseCase,
    GetFavoriteLocationsUseCase getFavoriteLocationsUseCase,
    GetFavoriteRoutesUseCase getFavoriteRoutesUseCase,
    GetMyOwnRoutesUseCase getMyOwnRoutesUseCase,
    GetCachedRoutesUseCase getCachedRoutesUseCase,
    GetInitialSettingsUseCase getInitialSettingsUseCase,
    GetAvailableSubscriptionsUseCase getAvailableSubscriptionsUseCase,
  ) =>
      SplashPageController(
        isAuthorizedUseCase: isAuthorizedUseCase,
        getAllLocationsUseCase: getAllLocationsUseCase,
        getAllRoutesUseCase: getAllRoutesUseCase,
        getLocationsAvailableFiltersUseCase:
            getLocationsAvailableFiltersUseCase,
        getRoutesAvailableFiltersUseCase: getRoutesAvailableFiltersUseCase,
        getAppVersion: getAppVersion,
        getAllTripsUseCase: getAllTripsUseCase,
        getFavoriteLocationsUseCase: getFavoriteLocationsUseCase,
        getFavoriteRoutesUseCase: getFavoriteRoutesUseCase,
        getMyOwnRoutesUseCase: getMyOwnRoutesUseCase,
        getCachedRoutesUseCase: getCachedRoutesUseCase,
        getInitialSettingsUseCase: getInitialSettingsUseCase,
        getAvailableSubscriptionsUseCase: getAvailableSubscriptionsUseCase,
      );

  @lazySingleton
  LocationsTabController getLocationsTabController(
    GetAllLocationsUseCase getAllLocationsUseCase,
  ) =>
      LocationsTabController(
        getAllLocationsUseCase,
      );

  @lazySingleton
  LocationFavoriteButtonController getLocationFavoriteButtonController(
    UpdateLocationFavoriteStatusUseCase updateLocationFavoriteStatusUseCase,
  ) =>
      LocationFavoriteButtonController(updateLocationFavoriteStatusUseCase);

  @lazySingleton
  LocationDetailsPageController getLocationDetailsPageController(
    GetLocationDetailsUseCase getLocationDetailsUseCase,
  ) =>
      LocationDetailsPageController(getLocationDetailsUseCase);

  @lazySingleton
  LocationReviewsPageController getLocationReviewsPageController(
    GetLocationReviewsUseCase getLocationReviewsUseCase,
  ) =>
      LocationReviewsPageController(getLocationReviewsUseCase);

  @lazySingleton
  RoutesTabController getRoutesTabController(
    GetAllRoutesUseCase getAllRoutesUseCase,
  ) =>
      RoutesTabController(
        getAllRoutesUseCase,
      );

  @lazySingleton
  RouteFavoriteButtonController getRouteFavoriteButtonController(
    UpdateRouteFavoriteStatusUseCase updateRouteFavoriteStatusUseCase,
  ) =>
      RouteFavoriteButtonController(updateRouteFavoriteStatusUseCase);

  @lazySingleton
  RouteDetailsPageController getRouteDetailsPageController(
    GetRouteDetailsUseCase getRouteDetailsUseCase,
  ) =>
      RouteDetailsPageController(getRouteDetailsUseCase);

  @lazySingleton
  RouteLocationsPageController getRouteLocationsController(
    GetRouteLocationsUseCase getRouteLocationsUseCase,
  ) =>
      RouteLocationsPageController(getRouteLocationsUseCase);

  @lazySingleton
  RouteReviewsPageController getRouteReviewsPageController(
    GetRouteReviewsUseCase getRouteReviewsUseCase,
  ) =>
      RouteReviewsPageController(getRouteReviewsUseCase);

  @lazySingleton
  LocationFiltersPageController getLocationFiltersPageController(
    GetAllLocationsUseCase getAllLocationsUseCase,
  ) =>
      LocationFiltersPageController(getAllLocationsUseCase);

  @lazySingleton
  RouteFiltersPageController getRouteFiltersPageController(
    GetAllRoutesUseCase getAllRoutesUseCase,
  ) =>
      RouteFiltersPageController(getAllRoutesUseCase);

  @lazySingleton
  TripsTabController getTripsTabController(GetTripsUseCase getTripsUseCase) =>
      TripsTabController(getTripsUseCase);

  @lazySingleton
  TripFiltersPageController getTripFiltersPageController(
    GetTripsUseCase getTripsUseCase,
  ) =>
      TripFiltersPageController(getTripsUseCase);

  @lazySingleton
  TripDetailsPageController getTripDetailsPageController(
    GetTripDetailsUseCase getTripDetailsUseCase,
    CompleteTripUseCase completeTripUseCase,
  ) =>
      TripDetailsPageController(
        getTripDetailsUseCase,
        completeTripUseCase,
      );

  @lazySingleton
  RouteMapPageController getRouteMapPageController(
    CacheRouteUseCase cacheRouteUseCase,
    GetRouteDetailsUseCase getRouteDetailsUseCase,
    GetGeopositionUseCase getGeopositionUseCase,
  ) =>
      RouteMapPageController(
        cacheRouteUseCase: cacheRouteUseCase,
        getRouteDetailsUseCase: getRouteDetailsUseCase,
        getGeopositionUseCase: getGeopositionUseCase,
      );

  @lazySingleton
  FavoriteLocationsPageController getFavoriteLocationsPageController(
    GetFavoriteLocationsUseCase getFavoriteLocationsUseCase,
  ) =>
      FavoriteLocationsPageController(getFavoriteLocationsUseCase);

  @lazySingleton
  CreateRoutePageController createRoutePageController(
    GetRoutePreviewUseCase getRoutePreviewUseCase,
    CreateNewRouteUseCase createNewRouteUseCase,
  ) =>
      CreateRoutePageController(
        getRoutePreviewUseCase: getRoutePreviewUseCase,
        createNewRouteUseCase: createNewRouteUseCase,
      );

  @lazySingleton
  FavoriteRoutesTabController favoriteRoutesTabController(
    GetFavoriteRoutesUseCase getFavoriteRoutesUseCase,
    SetTripRouteUseCase setTripRouteUseCase,
  ) =>
      FavoriteRoutesTabController(
        getFavoriteRoutesUseCase: getFavoriteRoutesUseCase,
        setTripRouteUseCase: setTripRouteUseCase,
      );

  @lazySingleton
  MyOwnRoutesTabController myOwnRoutesTabController(
    GetMyOwnRoutesUseCase getMyOwnRoutesUseCase,
  ) =>
      MyOwnRoutesTabController(getMyOwnRoutesUseCase);

  @lazySingleton
  CachedRoutesTabController cachedRoutesTabController(
    GetCachedRoutesUseCase getCachedRoutesUseCase,
    DeleteCachedRouteUseCase deleteCachedRouteUseCase,
  ) =>
      CachedRoutesTabController(
        getCachedRoutesUseCase: getCachedRoutesUseCase,
        deleteCachedRouteUseCase: deleteCachedRouteUseCase,
      );

  @lazySingleton
  SignUpPageController signUpPageController(SignUpUseCase signUpUseCase) =>
      SignUpPageController(
        signUpUseCase,
      );

  @lazySingleton
  StartPageController startPageController(
    LoginUseCase loginUseCase,
  ) =>
      StartPageController(loginUseCase);

  @lazySingleton
  ProfileTabController profileTabController(
    LogoutUseCase logoutUseCase,
    ChangeLocaleUseCase changeLocaleUseCase,
    ChangeThemeModeUseCase changeThemeModeUseCase,
  ) =>
      ProfileTabController(
        logoutUseCase: logoutUseCase,
        changeLocaleUseCase: changeLocaleUseCase,
        changeThemeModeUseCase: changeThemeModeUseCase,
      );

  @lazySingleton
  CachedRouteDetailsPageController cachedRouteDetailsPageController(
    GetCachedRouteDetailsUseCase getCachedRouteDetailsUseCase,
  ) =>
      CachedRouteDetailsPageController(getCachedRouteDetailsUseCase);

  @lazySingleton
  CachedRouteMapPageController cachedRouteMapPageController(
    GetCachedRouteDetailsUseCase getCachedRouteDetailsUseCase,
    GetGeopositionUseCase getGeopositionUseCase,
  ) =>
      CachedRouteMapPageController(
        getCachedRouteDetailsUseCase: getCachedRouteDetailsUseCase,
        getGeopositionUseCase: getGeopositionUseCase,
      );

  @lazySingleton
  CreateTripPageController createTripPageController(
    GetUserByEmailUseCase getUserByEmailUseCase,
    RemoveUserFromCreatingTripUseCase removeUserFromCreatingTripUseCase,
    SetTripRouteUseCase setTripRouteUseCase,
    CreateTripUseCase createTripUseCase,
  ) =>
      CreateTripPageController(
        getUserByEmailUseCase: getUserByEmailUseCase,
        removeUserFromCreatingTripUseCase: removeUserFromCreatingTripUseCase,
        setTripRouteUseCase: setTripRouteUseCase,
        createTripUseCase: createTripUseCase,
      );

  @lazySingleton
  TripChatController tripChatController(
    SendMessageUseCase sendMessageUseCase,
    GetFirstMessagesPageUseCase getFirstMessagesPageUseCase,
    GetNextMessagesPageUseCase getNextMessagesPageUseCase,
    GetPreviousMessagesPageUseCase getPreviousMessagesPageUseCase,
    GetNewMessagesStreamUseCase getNewMessagesStreamUseCase,
  ) =>
      TripChatController(
        sendMessageUseCase: sendMessageUseCase,
        getFirstMessagesPageUseCase: getFirstMessagesPageUseCase,
        getNextMessagesPageUseCase: getNextMessagesPageUseCase,
        getPreviousMessagesPageUseCase: getPreviousMessagesPageUseCase,
        getNewMessagesStreamUseCase: getNewMessagesStreamUseCase,
      );

  @lazySingleton
  EditProfilePageController editProfilePageController(
    EditProfileUseCase editProfileUseCase,
  ) =>
      EditProfilePageController(editProfileUseCase);

  @lazySingleton
  SubscriptionPageController subscriptionPageController(
    CreateSubscriptionUseCase createSubscriptionUseCase,
  ) =>
      SubscriptionPageController(createSubscriptionUseCase);

  @lazySingleton
  CreateReviewPageController createReviewPageController(
    CreateReviewUseCase createReviewUseCase,
  ) =>
      CreateReviewPageController(createReviewUseCase);

  @lazySingleton
  ResetPasswordPageController resetPasswordPageController(
    ResetPasswordUseCase resetPasswordUseCase,
  ) =>
      ResetPasswordPageController(resetPasswordUseCase);

  @lazySingleton
  ChangePasswordPageController changePasswordPageController(
    ChangePasswordUseCase changePasswordUseCase,
  ) =>
      ChangePasswordPageController(changePasswordUseCase);
}
