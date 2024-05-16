import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onPressed;

  const CheckButton({
    super.key,
    required this.isChecked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: const Icon(Icons.check),
      isSelected: isChecked,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      iconSize: 28,
      padding: EdgeInsets.zero,
    );
  }
}
