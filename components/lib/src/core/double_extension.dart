import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

extension DoubleExt on double {
  String getDistance(BuildContext context) {
    final distance = this / 1000;
    return '${distance.toStringAsFixed(2)} ${context.strings.km}';
  }

  String getDuration(BuildContext context) {
    final duration = this / 3600;
    return '${duration.toStringAsFixed(2)} ${context.strings.h}';
  }
}
