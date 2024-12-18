import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProfileShortInfoView extends StatelessWidget {
  final User user;
  const ProfileShortInfoView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconPreview.user(
          radius: 36,
          imageBytes: user.photo,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullname,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                user.email,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
