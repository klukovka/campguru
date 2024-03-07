import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GetItData extends InheritedWidget {
  final GetIt locator;

  const GetItData({
    super.key,
    required super.child,
    required this.locator,
  });

  static GetItData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GetItData>()!;
  }

  @override
  bool updateShouldNotify(GetItData oldWidget) => oldWidget.locator != locator;
}
