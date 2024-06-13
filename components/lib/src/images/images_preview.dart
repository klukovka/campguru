import 'dart:typed_data';

import 'package:components/components.dart';
import 'package:components/src/core/widget_list_extension.dart';
import 'package:components/src/images/custom_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImagesPreview extends StatelessWidget {
  final List<Uint8List> images;
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
              .map<Widget>(
                (bytes) => SkeletonReplacement(
                  width: size,
                  height: size,
                  borderRadius: borderRadius,
                  child: CustomMemoryImage(
                    width: size,
                    borderRadius: borderRadius,
                    height: size,
                    bytes: bytes,
                  ),
                ),
              )
              .toList()
              .insertSeparator(
                () => SizedBox(width: separator),
                hasEndSeparator: true,
              ),
          if (images.length >= maxAmount)
            Skeleton.unite(
              borderRadius: borderRadius,
              child: FilledButton.tonal(
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
            ),
        ],
      );
    });
  }
}
