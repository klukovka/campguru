import 'dart:math';

import 'package:flutter/material.dart';

extension RandomExtension on Random {
  Color randomColor() => Color.fromARGB(
        1,
        nextInt(255),
        nextInt(255),
        nextInt(255),
      );
}
