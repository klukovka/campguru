import 'package:flutter/material.dart';

extension WidgetListExtension on Iterable<Widget> {
  List<Widget> insertSeparator(
    Widget Function() separator, {
    bool hasEndSeparator = false,
  }) {
    if (isEmpty) return toList();
    final result = <Widget>[];
    result.add(first);
    for (var element in skip(1)) {
      result.add(separator());
      result.add(element);
    }

    if (hasEndSeparator) {
      result.add(separator());
    }
    return result;
  }
}
