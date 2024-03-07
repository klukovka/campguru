import 'package:executable/di/di.dart';
import 'package:executable/di/env.dart';
import 'package:executable/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

void main() {
  configureDependencies(test.name);
  runApp(CampguruApp(locator: locator));
}
