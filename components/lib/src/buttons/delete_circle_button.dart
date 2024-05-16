import 'package:flutter/material.dart';

class DeleteCircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteCircleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: const Icon(Icons.delete),
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      iconSize: 28,
      padding: EdgeInsets.zero,
    );
  }
}
