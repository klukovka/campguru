import 'package:components/components.dart';
import 'package:flutter/material.dart';

class CircleIconPreview extends StatelessWidget {
  final Widget Function(BuildContext context) placeholder;
  final Color Function(BuildContext context)? backgroundColor;
  final String? imageUrl;
  final double radius;

  const CircleIconPreview({
    super.key,
    required this.placeholder,
    this.imageUrl,
    required this.radius,
    this.backgroundColor,
  });

  factory CircleIconPreview.user({
    Key? key,
    String? imageUrl,
    double radius = 24,
    Color? color,
  }) =>
      CircleIconPreview(
        key: key,
        imageUrl: imageUrl,
        placeholder: (context) => Icon(
          Theme.of(context).extension<CircleIconPreviewThemeData>()?.user,
          size: radius * 2,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        radius: radius,
        backgroundColor: (context) =>
            color ?? Theme.of(context).colorScheme.primary,
      );

  @override
  Widget build(BuildContext context) {
    return CircleNetworkImage(
      placeholder: placeholder(context),
      radius: radius,
      imageUrl: imageUrl,
      backgroundColor: backgroundColor?.call(context),
    );
  }
}

class CircleIconPreviewThemeData
    extends ThemeExtension<CircleIconPreviewThemeData> {
  final IconData user;

  CircleIconPreviewThemeData({
    required this.user,
  });

  @override
  ThemeExtension<CircleIconPreviewThemeData> lerp(
    ThemeExtension<CircleIconPreviewThemeData>? other,
    double t,
  ) =>
      other ?? this;

  @override
  ThemeExtension<CircleIconPreviewThemeData> copyWith({
    IconData? user,
  }) =>
      CircleIconPreviewThemeData(
        user: user ?? this.user,
      );
}
