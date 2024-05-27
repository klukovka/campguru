import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RoundedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool useCachedImage;

  const RoundedNetworkImage({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.isLoading = false,
    this.useCachedImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;

    if (imageUrl != null && !isLoading && useCachedImage) {
      return Center(
        child: CustomNetworkImage(
          borderRadius: BorderRadius.circular(8),
          imageUrl: imageUrl,
          width: width,
          height: height,
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      //TODO: Add Localization
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isLoading
            ? SpinKitThreeBounce(
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              )
            : Text(
                'Not available',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
      ),
    );
  }
}
