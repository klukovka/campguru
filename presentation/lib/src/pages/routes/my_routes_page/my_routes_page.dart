import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/pages/routes/my_routes_page/my_routes_page_tab_type.dart';

@RoutePage()
class MyRoutesPage extends StatelessWidget {
  const MyRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: MyRoutesPageTabType.values.map((e) => e.route).toList(),
      transitionBuilder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(title: Text(context.strings.myRoutes)),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => tabsRouter.setActiveIndex(index),
            currentIndex: tabsRouter.activeIndex,
            items: MyRoutesPageTabType.values.map((item) {
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
