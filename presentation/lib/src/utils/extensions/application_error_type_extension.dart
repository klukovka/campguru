import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

extension ApplicationErrorTypeExtension on ApplicationErrorType {
  String getLabel(BuildContext context) => switch (this) {
        ApplicationErrorType.noInternetConnection =>
          context.strings.noInternetConnectionError,
        ApplicationErrorType.general => context.strings.generalMobileError,
        ApplicationErrorType.toSaveMoreRoutesBuyPremium =>
          context.strings.toSaveMoreRoutesBuyPremiumError,
        ApplicationErrorType.geolocatorServiceDisabled =>
          context.strings.geolocatorServiceDisabledError,
        ApplicationErrorType.permissionDenied =>
          context.strings.permissionDeniedError,
        ApplicationErrorType.permissionDeniedForever =>
          context.strings.permissionDeniedForeverError,
      };
}
