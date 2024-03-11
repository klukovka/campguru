import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: Icon(
        Theme.of(context).extension<FavoriteButtonThemeData>()?.icon,
      ),
      selectedIcon: Icon(
        Theme.of(context).extension<FavoriteButtonThemeData>()?.selectedIcon,
      ),
      isSelected: isFavorite,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      iconSize: 28,
      padding: EdgeInsets.zero,
    );
  }
}

class FavoriteButtonThemeData extends ThemeExtension<FavoriteButtonThemeData> {
  final IconData icon;
  final IconData selectedIcon;
  FavoriteButtonThemeData({
    required this.icon,
    required this.selectedIcon,
  });

  @override
  FavoriteButtonThemeData copyWith({
    IconData? icon,
    IconData? selectedIcon,
  }) {
    return FavoriteButtonThemeData(
      icon: icon ?? this.icon,
      selectedIcon: selectedIcon ?? this.selectedIcon,
    );
  }

  @override
  ThemeExtension<FavoriteButtonThemeData> lerp(
          covariant ThemeExtension<FavoriteButtonThemeData>? other, double t) =>
      this;
}
