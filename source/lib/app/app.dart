import 'package:auto_route/auto_route.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        CreateRoute(),
        LibraryRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Theme(
            data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 28,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: AppColors.black,
              unselectedItemColor: AppColors.strongGrey,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.search_rounded),
                  activeIcon: Icon(Icons.search_rounded),
                ),
                BottomNavigationBarItem(
                  label: 'Create',
                  icon: Icon(Icons.add_circle_outline_rounded),
                  activeIcon: Icon(Icons.add_circle_rounded),
                ),
                BottomNavigationBarItem(
                  label: 'Library',
                  icon: Icon(Icons.folder_outlined),
                  activeIcon: Icon(Icons.folder_rounded),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  activeIcon: Icon(Icons.person_rounded),
                  icon: Icon(Icons.person_outline_rounded),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
