import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/home_page/profile_tab/views/profile_short_info_view.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class ProfileTab extends StatelessWidget implements AutoRouteWrapper {
  const ProfileTab({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<ProfileTabCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileTabCubit, ProfileTabState>(
      builder: (context, state) {
        return SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: ProfileShortInfoView(
                    user: state.user,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: Divider()),
            ],
          ),
        );
      },
    );
  }
}
