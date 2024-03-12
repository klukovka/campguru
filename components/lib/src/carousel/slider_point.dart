import 'package:flutter/material.dart';

class SliderPoint extends StatelessWidget {
  final bool isCurrent;
  final VoidCallback onPressed;
  final Color? color;
  final double size;

  const SliderPoint({
    super.key,
    required this.isCurrent,
    required this.onPressed,
    this.color,
    this.size = 8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      radius: 16,
      borderRadius: BorderRadius.circular(size * 2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ??
              Theme.of(context)
                  .colorScheme
                  .onPrimary
                  .withOpacity(isCurrent ? 1 : 0.5),
        ),
      ),
    );
  }
}
