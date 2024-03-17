import 'package:components/components.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPop;

  const DefaultAppBar({
    super.key,
    required this.onPop,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64,
      toolbarHeight: 48,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ArrowCircleButton.back(
          onPressed: onPop,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
