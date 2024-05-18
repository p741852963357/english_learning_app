import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: TypingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
          children: [
            CustomRoute(
              initial: true,
              page: TypingLearningRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: TypingResultRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
        CustomRoute(
          page: FlashcardsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
          children: [
            CustomRoute(
              initial: true,
              page: FlashcardsLearningRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: FlashcardsResultRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
        CustomRoute(
          page: QuizzesRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
          children: [
            CustomRoute(
              initial: true,
              page: QuizzesLearningRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: QuizzedResultRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: EditTopicRoute.page),
        CustomRoute(
          page: CreateTopicRoute.page,
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          durationInMilliseconds: 300,
        ),
        CustomRoute(page: AddTopicsToFolderRoute.page, transitionsBuilder: TransitionsBuilders.slideBottom, durationInMilliseconds: 300),
        CustomRoute(page: CreateFolderRoute.page, transitionsBuilder: TransitionsBuilders.slideBottom, durationInMilliseconds: 300),
        CustomRoute(page: EditFolderRoute.page, transitionsBuilder: TransitionsBuilders.slideBottom, durationInMilliseconds: 300),
        AutoRoute(page: AppRoute.page, children: [
          AutoRoute(page: CreateRoute.page),
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: LibraryRoute.page, children: [
            AutoRoute(page: TopicsRoute.page),
            AutoRoute(page: FoldersRoute.page),
          ]),
          AutoRoute(page: ProfileRoute.page),
        ]),
        AutoRoute(page: AuthenticationRoute.page),
        AutoRoute(page: LogInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        CustomRoute(
          page: TopicRoute.page,
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          page: FolderRoute.page,
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          durationInMilliseconds: 300,
        ),
      ];
}
