import 'package:flutter/material.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/users_list.dart';
import 'package:presentation/src/utils/skeletonizer/entities_skeletonizer_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingUsersList extends StatelessWidget {
  final bool _isSliver;

  const LoadingUsersList({super.key}) : _isSliver = false;
  const LoadingUsersList.sliver({super.key}) : _isSliver = true;

  @override
  Widget build(BuildContext context) {
    final users = List.generate(
      5,
      (index) => EntitiesSkeletonizerUtils.user,
    );

    if (_isSliver) {
      return Skeletonizer.sliver(
        child: UsersList.sliver(users: users),
      );
    }
    return Skeletonizer(
      child: UsersList(users: users),
    );
  }
}
