import 'package:components/components.dart';
import 'package:flutter/material.dart';

class RatingInfoNameAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String name;
  final double mark;

  const RatingInfoNameAppBar({
    super.key,
    required this.name,
    required this.mark,
  });

  @override
  Widget build(BuildContext context) {
    return RatingNameInfoBar(
      name: name,
      mark: mark,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(132);
}
