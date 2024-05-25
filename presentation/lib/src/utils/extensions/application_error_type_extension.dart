import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

extension ApplicationErrorTypeExtension on ApplicationErrorType {
  //TODO: Add localizations
  String getLabel(BuildContext context) => switch (this) {
        ApplicationErrorType.noInternetConnection => 'No Internet Connection',
        ApplicationErrorType.general => 'Mobile Application Error has occured!',
        ApplicationErrorType.toSaveMoreRoutesBuyPremium =>
          'Buy premium to save more routes!',
        ApplicationErrorType.geolocatorServiceDisabled =>
          'Geolocator Service Disabled.',
        ApplicationErrorType.permissionDenied =>
          'Permission is denied. Please, turn on it in phone settings.',
        ApplicationErrorType.permissionDeniedForever =>
          'Permission is forever denied. Please, turn on it in phone settings.',
      };
}
