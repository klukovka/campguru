import 'package:components/src/core/widget_list_extension.dart';
import 'package:flutter/material.dart';

class ImagesPreview extends StatelessWidget {
  final List<String> images;
  final double separator;
  final int maxAmount;

  const ImagesPreview({
    super.key,
    required this.images,
    this.separator = 8,
    this.maxAmount = 3,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);
    return LayoutBuilder(builder: (context, constraints) {
      final size =
          (constraints.maxWidth - separator * (maxAmount - 1)) / maxAmount;
      return Row(
        children: [
          ...images
              .take(maxAmount - 1)
              .map<Widget>((url) => Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList()
              .insertSeparator(
                () => SizedBox(width: separator),
                hasEndSeparator: true,
              ),
          if (images.length >= maxAmount)
            FilledButton.tonal(
              onPressed: () {
                //TODO: Open all images gallery
              },
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(size, size),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: borderRadius),
                ),
              ),
              child: Icon(Icons.more_horiz, size: size / 3),
            ),
        ],
      );
    });
  }
}
