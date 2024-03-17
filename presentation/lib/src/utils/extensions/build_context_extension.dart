import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/config/di/get_it_data.dart';

extension BuildContextExtension on BuildContext {
  GetIt get locator => GetItData.of(this).locator;
  CampguruRouter get appRouter => locator<CampguruRouter>();
}
