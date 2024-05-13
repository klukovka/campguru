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
      builder: (_) => const Positioned(
          bottom: 70, right: 0, left: 0, child: RouteCacheProgressView()));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Overlay.of(context, rootOverlay: true).insert(overlay);
    });
  }

  @override
  void dispose() {
    overlay.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
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
