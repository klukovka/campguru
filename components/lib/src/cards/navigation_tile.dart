import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget leading;
  final Widget title;

  const NavigationTile({
    super.key,
    required this.onPressed,
    required this.title,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: IconTheme(
          data: IconThemeData(
            size: 24,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                leading,
                const SizedBox(width: 16),
                Expanded(
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                    child: title,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
