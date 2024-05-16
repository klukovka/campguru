import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/home_page/home_page_tab_type.dart';
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
    //TODO: Add localizations
    final tiles = <Widget>[
      NavigationTile(
        leading: Icon(MdiIcons.account),
        title: const Text('Edit Profile'),
        onPressed: () {
          //TODO: Add navigation to edit
        },
      ),
      NavigationTile(
        leading: Icon(MdiIcons.accountCash),
        title: const Text('Subscription'),
        onPressed: () {
          //TODO: Add navigation to edit
        },
      ),
      NavigationTile(
        leading: Icon(HomePageTabType.locations.iconData),
        title: const Text('Favorite Locations'),
        onPressed: context.appRouter.pushFavoriteLocationsPage,
      ),
      NavigationTile(
        leading: Icon(HomePageTabType.routes.iconData),
        title: const Text('Saved Routes'),
        onPressed: context.appRouter.pushMyRoutesPage,
      ),
      NavigationTile(
        leading: Icon(MdiIcons.help),
        title: const Text('Tourist Tips'),
        onPressed: () {
          //TODO: Add navigation to tips
        },
      ),
      NavigationTile(
        leading: const Icon(Icons.language),
        title: const Text('Language'),
        onPressed: () {
          //TODO: Add navigation to settings
        },
      ),
      NavigationTile(
        leading: Icon(MdiIcons.themeLightDark),
        title: const Text('Theme'),
        onPressed: () {
          //TODO: Add navigation to change theme
        },
      ),
    ];
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<ProfileTabCubit, ProfileTabState>(
                  builder: (context, state) {
                return ProfileShortInfoView(
                  user: state.user,
                );
              }),
            ),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.separated(
              itemBuilder: (context, index) => tiles[index],
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: tiles.length,
            ),
          ),
          const SliverToBoxAdapter(child: Divider()),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: BlocBuilder<ProfileTabCubit, ProfileTabState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () {
                            //TODO: Logout
                          },
                          icon: Icon(MdiIcons.exitToApp),
                          label: const Text('Logout'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text('Version: ${state.version}'),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
