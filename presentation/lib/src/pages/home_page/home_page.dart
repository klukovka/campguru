import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/home_page/home_page_tab_type.dart';
import 'package:presentation/src/pages/home_page/views/bottom_navigation_bar_avatar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  icon: BottomNavigationBarAvarar(
                    imageUrl:
                        'https://townsquare.media/site/366/files/2024/01/attachment-noah_sebastian_bad_omens_singer_interview_video_screenshot.jpg',
                    isCurrent:
                        tabsRouter.activeIndex == HomePageTabType.profile.index,
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
  }
}
