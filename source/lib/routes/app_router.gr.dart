// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:client/app/app.dart' as _i1;
import 'package:client/features/authentication/presentation/screens/authentication_screen.dart'
    as _i2;
import 'package:client/features/authentication/presentation/screens/log_in_screen.dart'
    as _i10;
import 'package:client/features/authentication/presentation/screens/sign_up_screen.dart'
    as _i12;
import 'package:client/features/create/data/models/topic_model.dart' as _i18;
import 'package:client/features/create/presentation/screens/create_folder_screen.dart'
    as _i3;
import 'package:client/features/create/presentation/screens/create_screen.dart'
    as _i4;
import 'package:client/features/create/presentation/screens/create_topic_screen.dart'
    as _i5;
import 'package:client/features/home/presentation/screens/home_screen.dart'
    as _i8;
import 'package:client/features/library/presentation/screens/folder_screen.dart'
    as _i6;
import 'package:client/features/library/presentation/screens/folders_screen.dart'
    as _i7;
import 'package:client/features/library/presentation/screens/library_screen.dart'
    as _i9;
import 'package:client/features/library/presentation/screens/topic_screen.dart'
    as _i14;
import 'package:client/features/library/presentation/screens/topics_screen.dart'
    as _i15;
import 'package:client/features/profile/presentation/screens/profile_screen.dart'
    as _i11;
import 'package:client/features/splash/presentation/screens/splash_screen.dart'
    as _i13;
import 'package:flutter/material.dart' as _i17;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppScreen(),
      );
    },
    AuthenticationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthenticationScreen(),
      );
    },
    CreateFolderRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CreateFolderScreen(),
      );
    },
    CreateRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateScreen(),
      );
    },
    CreateTopicRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateTopicScreen(),
      );
    },
    FolderRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FolderScreen(),
      );
    },
    FoldersRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FoldersScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeScreen(),
      );
    },
    LibraryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LibraryScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LogInScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashScreen(),
      );
    },
    TopicRoute.name: (routeData) {
      final args = routeData.argsAs<TopicRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.TopicScreen(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    TopicsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.TopicsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppScreen]
class AppRoute extends _i16.PageRouteInfo<void> {
  const AppRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthenticationScreen]
class AuthenticationRoute extends _i16.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CreateFolderScreen]
class CreateFolderRoute extends _i16.PageRouteInfo<void> {
  const CreateFolderRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CreateFolderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateFolderRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CreateScreen]
class CreateRoute extends _i16.PageRouteInfo<void> {
  const CreateRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CreateTopicScreen]
class CreateTopicRoute extends _i16.PageRouteInfo<void> {
  const CreateTopicRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CreateTopicRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTopicRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.FolderScreen]
class FolderRoute extends _i16.PageRouteInfo<void> {
  const FolderRoute({List<_i16.PageRouteInfo>? children})
      : super(
          FolderRoute.name,
          initialChildren: children,
        );

  static const String name = 'FolderRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FoldersScreen]
class FoldersRoute extends _i16.PageRouteInfo<void> {
  const FoldersRoute({List<_i16.PageRouteInfo>? children})
      : super(
          FoldersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoldersRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LibraryScreen]
class LibraryRoute extends _i16.PageRouteInfo<void> {
  const LibraryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LogInScreen]
class LogInRoute extends _i16.PageRouteInfo<void> {
  const LogInRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SignUpScreen]
class SignUpRoute extends _i16.PageRouteInfo<void> {
  const SignUpRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.TopicScreen]
class TopicRoute extends _i16.PageRouteInfo<TopicRouteArgs> {
  TopicRoute({
    _i17.Key? key,
    required _i18.TopicModel topic,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          TopicRoute.name,
          args: TopicRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TopicRoute';

  static const _i16.PageInfo<TopicRouteArgs> page =
      _i16.PageInfo<TopicRouteArgs>(name);
}

class TopicRouteArgs {
  const TopicRouteArgs({
    this.key,
    required this.topic,
  });

  final _i17.Key? key;

  final _i18.TopicModel topic;

  @override
  String toString() {
    return 'TopicRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [_i15.TopicsScreen]
class TopicsRoute extends _i16.PageRouteInfo<void> {
  const TopicsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          TopicsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopicsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
