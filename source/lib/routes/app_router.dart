import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        CustomRoute(
            page: CreateTopicRoute.page,
            transitionsBuilder: TransitionsBuilders.slideBottom,
            durationInMilliseconds: 400),
        AutoRoute(page: AppRoute.page, children: [
          AutoRoute(page: CreateRoute.page),
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: LibraryRoute.page),
          AutoRoute(page: ProfileRoute.page),
        ]),
      ];
}
