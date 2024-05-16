import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/home_page/home_page_tab_type.dart';
import 'package:presentation/src/pages/home_page/views/bottom_navigation_bar_avatar.dart';
import 'package:presentation/src/pages/routes/views/route_cache_progress/route_cache_progress_view.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<HomePageCubit>(),
      child: this,
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final overlay = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 70 + MediaQuery.paddingOf(context).bottom,
      right: 0,
      left: 0,
      child: const RouteCacheProgressView(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state.isCompleted) {
          if (overlay.mounted) {
            overlay.remove();
          }
        } else {
          if (!overlay.mounted) {
            Overlay.of(context, rootOverlay: true).insert(overlay);
          }
        }
      },
      builder: (context, state) {
        final userAvatar = state.userAvatar;
        return AutoTabsRouter(
          routes: HomePageTabType.values.map((e) => e.route).toList(),
          transitionBuilder: (context, child, animation) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              body: FadeTransition(
                opacity: animation,
                child: child,
              ),
              floatingActionButton: switch (tabsRouter.activeIndex) {
                int x when x == HomePageTabType.routes.index =>
                  FloatingActionButton(
                    onPressed: context.appRouter.pushCreateRoutePage,
                    child: const Icon(Icons.add),
                  ),
                _ => null,
              },
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) => tabsRouter.setActiveIndex(index),
                currentIndex: tabsRouter.activeIndex,
                items: HomePageTabType.values.map((item) {
                  if (item == HomePageTabType.profile) {
                    return BottomNavigationBarItem(
                      icon: BottomNavigationBarAvatar(
                        imageUrl: userAvatar,
                        isCurrent: tabsRouter.activeIndex ==
                            HomePageTabType.profile.index,
                      ),
                      label: item.getDisplayText(context),
                    );
                  }
                  return BottomNavigationBarItem(
                    icon: Icon(item.iconData, size: 32),
                    label: item.getDisplayText(context),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}
