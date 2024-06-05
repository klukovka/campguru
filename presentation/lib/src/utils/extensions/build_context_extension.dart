import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/config/di/get_it_data.dart';
import 'package:presentation/src/utils/extensions/application_error_type_extension.dart';

extension BuildContextExtension on BuildContext {
  GetIt get locator => GetItData.of(this).locator;
  CampguruRouter get appRouter => locator<CampguruRouter>();
  CampguruToasts get toasts => CampguruToasts.of(this);
  void showError(Failure failure) {
    final message = failure.message ?? '';
    final title = switch (failure) {
      ApplicationFailure() => failure.type.getLabel(this),
      ApiFailure() => strings.serverErrorOccured
    };

    appRouter.pushErrorDialog(title: title, message: message);
  }
}
