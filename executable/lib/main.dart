import 'package:executable/di/di.dart';
import 'package:executable/di/env.dart';
import 'package:executable/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(test.name);
  runApp(CampguruApp(locator: locator));
}
