import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RoundedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final bool isLoading;

  const RoundedNetworkImage({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primary,
        image: imageUrl != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              )
            : null,
      ),
      //TODO: Add Localization
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isLoading
            ? SpinKitThreeBounce(
                color: Theme.of(context).colorScheme.onPrimary,
                size: 16,
              )
            : imageUrl == null
                ? Text(
                    'Not available',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                : null,
      ),
    );
  }
}
