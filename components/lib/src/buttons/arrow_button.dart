import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData _iconData;

  const ArrowButton.back({
    super.key,
    required this.onPressed,
  }) : _iconData = Icons.arrow_back_ios_rounded;

  const ArrowButton.forward({
    super.key,
    required this.onPressed,
  }) : _iconData = Icons.arrow_forward_ios_rounded;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: Icon(_iconData),
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      iconSize: 28,
      padding: EdgeInsets.zero,
    );
  }
}
