import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final bool isNotEmpty;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.isNotEmpty,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: Icon(
        Theme.of(context).extension<FilterButtonThemeData>()?.icon,
      ),
      selectedIcon: Icon(
        Theme.of(context).extension<FilterButtonThemeData>()?.selectedIcon,
      ),
      isSelected: isNotEmpty,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      iconSize: 28,
      padding: EdgeInsets.zero,
    );
  }
}

class FilterButtonThemeData extends ThemeExtension<FilterButtonThemeData> {
  final IconData icon;
  final IconData selectedIcon;
  FilterButtonThemeData({
    required this.icon,
    required this.selectedIcon,
  });

  @override
  FilterButtonThemeData copyWith({
    IconData? icon,
    IconData? selectedIcon,
  }) {
    return FilterButtonThemeData(
      icon: icon ?? this.icon,
      selectedIcon: selectedIcon ?? this.selectedIcon,
    );
  }

  @override
  ThemeExtension<FilterButtonThemeData> lerp(
          covariant ThemeExtension<FilterButtonThemeData>? other, double t) =>
      this;
}
