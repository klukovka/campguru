import 'package:components/components.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPop;
  final Widget? trailing;

  const DefaultAppBar({
    super.key,
    required this.onPop,
    this.trailing,
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
        child: IconCircleButton.arrowBack(
          onPressed: onPop,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: trailing,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
