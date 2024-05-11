import 'package:auto_route/auto_route.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      routes: const [TopicsRoute(), FoldersRoute()],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.lightGrey,
            title: const Text(
              "Library",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            centerTitle: true,
            bottom: TabBar(
              labelPadding: const EdgeInsets.only(right: 30),
              isScrollable: true,
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              unselectedLabelColor: AppColors.strongGrey,
              labelColor: AppColors.black,
              splashFactory: NoSplash.splashFactory,
              indicatorColor: AppColors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              controller: controller,
              tabs: const [
                Tab(
                  text: "Topics",
                ),
                Tab(
                  text: "Folders",
                ),
              ],
            ),
          ),
          body: child,
        );
      },
    );
  }
}
