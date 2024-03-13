import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool _isLarge;

  const ArrowButton.large({
    super.key,
    required this.onPressed,
    required this.child,
  }) : _isLarge = true;

  const ArrowButton.small({
    super.key,
    required this.onPressed,
    required this.child,
  }) : _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          _isLarge
              ? Theme.of(context).textTheme.titleLarge
              : Theme.of(context).textTheme.bodyLarge,
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Theme.of(context).colorScheme.secondaryContainer;
          }
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.focused)) {
            return Theme.of(context).colorScheme.primaryContainer;
          }
          return Theme.of(context).colorScheme.primary;
        }),
      ),
      child: Row(
        children: [
          child,
          const SizedBox(width: 4),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: _isLarge ? 20 : 16,
          ),
        ],
      ),
    );
  }
}
