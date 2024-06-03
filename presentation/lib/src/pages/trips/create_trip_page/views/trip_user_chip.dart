import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class TripUserChip extends StatelessWidget {
  final User user;

  const TripUserChip({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      deleteIcon: Icon(
        Theme.of(context).extension<SearchFieldThemeData>()?.clear,
      ),
      onDeleted: () =>
          context.locator<CreateTripPageController>().removeUser(user),
      deleteIconColor: Theme.of(context).colorScheme.primary,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleIconPreview.user(
            imageBytes: user.photo,
            radius: 12,
          ),
          const SizedBox(width: 8),
          Text(user.fullname),
        ],
      ),
    );
  }
}
