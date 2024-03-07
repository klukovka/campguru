import 'package:flutter/material.dart';

class BottomNavigationBarAvarar extends StatelessWidget {
  final String imageUrl;
  final bool isCurrent;

  const BottomNavigationBarAvarar({
    super.key,
    required this.imageUrl,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isCurrent
            ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
            : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
