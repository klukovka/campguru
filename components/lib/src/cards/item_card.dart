import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final Widget content;
  final Widget? favoriteButton;
  final VoidCallback onPressed;

  const ItemCard({
    super.key,
    required this.imageUrl,
    required this.content,
    required this.onPressed,
    this.favoriteButton,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteButton = this.favoriteButton;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            children: [
              RoundedNetworkImage(
                imageUrl: imageUrl,
                height: 152,
                width: 100,
              ),
              const SizedBox(width: 16),
              Expanded(child: content),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowCircleButton.forward(onPressed: onPressed),
                  favoriteButton ?? const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
