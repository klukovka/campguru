import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/pages/home_page/home_page_tab_type.dart';
import 'package:presentation/src/pages/home_page/views/bottom_navigation_bar_avatar.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<HomePageCubit>(),
      child: this,
    );
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
