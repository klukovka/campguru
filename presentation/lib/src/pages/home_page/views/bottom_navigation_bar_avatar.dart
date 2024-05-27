import 'dart:typed_data';

import 'package:components/components.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarAvatar extends StatelessWidget {
  final Uint8List? imageBytes;
  final bool isCurrent;

  const BottomNavigationBarAvatar({
    super.key,
    required this.imageBytes,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final color = isCurrent
        ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
        : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color!, width: 2),
      ),
      child: CircleIconPreview.user(
        radius: 16,
        imageBytes: imageBytes,
        color: color,
      ),
    );
  }
}
