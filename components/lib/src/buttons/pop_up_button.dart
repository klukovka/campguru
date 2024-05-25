import 'package:flutter/material.dart';

class PopUpButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final TextStyle? Function(BuildContext) style;

  const PopUpButton._({
    super.key,
    required this.child,
    required this.onPressed,
    required this.style,
  });

  factory PopUpButton.primary({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
  }) =>
      PopUpButton._(
        key: key,
        onPressed: onPressed,
        style: (context) => Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              height: 32 / 18,
              color: Theme.of(context).colorScheme.primary,
            ),
        child: child,
      );

  factory PopUpButton.secondary({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
  }) =>
      PopUpButton._(
        key: key,
        onPressed: onPressed,
        style: (context) => Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              height: 32 / 18,
            ),
        child: child,
      );

  factory PopUpButton.error({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
  }) =>
      PopUpButton._(
        key: key,
        onPressed: onPressed,
        style: (context) => Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              height: 32 / 18,
              color: Theme.of(context).colorScheme.error,
            ),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return Theme.of(context)
                .colorScheme
                .onPrimaryContainer
                .withOpacity(0.04);
          }
          if (states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.focused)) {
            return Theme.of(context)
                .colorScheme
                .onPrimaryContainer
                .withOpacity(0.04);
          }

          return null;
        },
      ),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: style(context) ?? const TextStyle(),
          child: child,
        ),
      ),
    );
  }
}
