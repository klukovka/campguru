import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/user_tile.dart';

class UsersList extends StatelessWidget {
  final List<User> users;
  final bool _isSliver;

  const UsersList({super.key, required this.users}) : _isSliver = false;
  const UsersList.sliver({super.key, required this.users}) : _isSliver = true;

  @override
  Widget build(BuildContext context) {
    if (_isSliver) {
      return SliverList.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
        itemCount: users.length,
      );
    }

    return ListView.separated(
      itemBuilder: _itemBuilder,
      separatorBuilder: _separatorBuilder,
      itemCount: users.length,
    );
  }

  Widget _itemBuilder(context, index) => Padding(
        padding: const EdgeInsets.all(16),
        child: UserTile(user: users[index]),
      );

  Widget _separatorBuilder(context, index) => const Divider();
}
