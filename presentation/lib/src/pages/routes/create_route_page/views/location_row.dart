import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class LocationRow extends StatelessWidget {
  final Location location;
  final VoidCallback onPressed;

  const LocationRow({
    super.key,
    required this.location,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            location.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          splashRadius: 16,
          icon: Icon(
            Icons.close,
            size: 16,
            color: Theme.of(context).colorScheme.error,
          ),
        )
      ],
    );
  }
}
