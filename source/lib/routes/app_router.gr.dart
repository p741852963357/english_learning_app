// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i35;
import 'package:client/app/app.dart' as _i2;
import 'package:client/features/authentication/presentation/screens/authentication_screen.dart'
    as _i3;
import 'package:client/features/authentication/presentation/screens/forgot_password_screen.dart'
    as _i15;
import 'package:client/features/authentication/presentation/screens/log_in_screen.dart'
    as _i18;
import 'package:client/features/authentication/presentation/screens/otp_screen.dart'
    as _i19;
import 'package:client/features/authentication/presentation/screens/reset_password_screen.dart'
    as _i27;
import 'package:client/features/authentication/presentation/screens/sign_up_screen.dart'
    as _i28;
import 'package:client/features/create/data/models/folder_model.dart' as _i38;
import 'package:client/features/create/data/models/topic_model.dart' as _i39;
import 'package:client/features/create/presentation/screens/create_folder_screen.dart'
    as _i5;
import 'package:client/features/create/presentation/screens/create_screen.dart'
    as _i6;
import 'package:client/features/create/presentation/screens/create_topic_screen.dart'
    as _i7;
import 'package:client/features/home/presentation/screens/home_screen.dart'
    as _i16;
import 'package:client/features/library/data/models/topic_list_model.dart'
    as _i37;
import 'package:client/features/library/features/public_topic/presentation/screens/public_topic_screen.dart'
    as _i21;
import 'package:client/features/library/features/public_topic/presentation/screens/public_topics_screen.dart'
    as _i22;
import 'package:client/features/library/presentation/screens/add_topics_to_folder_screen.dart'
    as _i1;
import 'package:client/features/library/presentation/screens/edit_folder_screen.dart'
    as _i8;
import 'package:client/features/library/presentation/screens/edit_topic_screen.dart'
    as _i9;
import 'package:client/features/library/presentation/screens/flashcards_learning_screen.dart'
    as _i10;
import 'package:client/features/library/presentation/screens/flashcards_result_screen.dart'
    as _i11;
import 'package:client/features/library/presentation/screens/flashcards_screen.dart'
    as _i12;
import 'package:client/features/library/presentation/screens/folder_screen.dart'
    as _i13;
import 'package:client/features/library/presentation/screens/folders_screen.dart'
    as _i14;
import 'package:client/features/library/presentation/screens/library_screen.dart'
    as _i17;
import 'package:client/features/library/presentation/screens/quizzes_learning_screen.dart'
    as _i24;
import 'package:client/features/library/presentation/screens/quizzes_result_screen.dart'
    as _i23;
import 'package:client/features/library/presentation/screens/quizzes_screen.dart'
    as _i25;
import 'package:client/features/library/presentation/screens/ranking_screen.dart'
    as _i26;
import 'package:client/features/library/presentation/screens/topic_screen.dart'
    as _i30;
import 'package:client/features/library/presentation/screens/topics_screen.dart'
    as _i31;
import 'package:client/features/library/presentation/screens/typing_learning_screen.dart'
    as _i32;
import 'package:client/features/library/presentation/screens/typing_pratice_screen.dart'
    as _i34;
import 'package:client/features/library/presentation/screens/typing_result_screen.dart'
    as _i33;
import 'package:client/features/profile/presentation/screens/change_password_screen.dart'
    as _i4;
import 'package:client/features/profile/presentation/screens/profile_screen.dart'
    as _i20;
import 'package:client/features/splash/presentation/screens/splash_screen.dart'
    as _i29;
import 'package:flutter/material.dart' as _i36;

abstract class $AppRouter extends _i35.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i35.PageFactory> pagesMap = {
    AddTopicsToFolderRoute.name: (routeData) {
      final args = routeData.argsAs<AddTopicsToFolderRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddTopicsToFolderScreen(
          key: args.key,
          topicList: args.topicList,
          folderId: args.folderId,
        ),
      );
    },
    AppRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AppScreen(),
      );
    },
    AuthenticationRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthenticationScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChangePasswordScreen(),
      );
    },
    CreateFolderRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateFolderScreen(),
      );
    },
    CreateRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CreateScreen(),
      );
    },
    CreateTopicRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreateTopicScreen(),
      );
    },
    EditFolderRoute.name: (routeData) {
      final args = routeData.argsAs<EditFolderRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.EditFolderScreen(
          key: args.key,
          folder: args.folder,
        ),
      );
    },
    EditTopicRoute.name: (routeData) {
      final args = routeData.argsAs<EditTopicRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.EditTopicScreen(
          key: args.key,
          topicModel: args.topicModel,
        ),
      );
    },
    FlashcardsLearningRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.FlashcardsLearningScreen(),
      );
    },
    FlashcardsResultRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.FlashcardsResultScreen(),
      );
    },
    FlashcardsRoute.name: (routeData) {
      final args = routeData.argsAs<FlashcardsRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.FlashcardsScreen(
          args.topic,
          key: args.key,
        ),
      );
    },
    FolderRoute.name: (routeData) {
      final args = routeData.argsAs<FolderRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.FolderScreen(
          key: args.key,
          folder: args.folder,
        ),
      );
    },
    FoldersRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.FoldersScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.HomeScreen(),
      );
    },
    LibraryRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.LibraryScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.LogInScreen(),
      );
    },
    OTPRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.OTPScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.ProfileScreen(),
      );
    },
    PublicTopicRoute.name: (routeData) {
      final args = routeData.argsAs<PublicTopicRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.PublicTopicScreen(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    PublicTopicsRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.PublicTopicsScreen(),
      );
    },
    QuizzedResultRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.QuizzedResultScreen(),
      );
    },
    QuizzesLearningRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.QuizzesLearningScreen(),
      );
    },
    QuizzesRoute.name: (routeData) {
      final args = routeData.argsAs<QuizzesRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.QuizzesScreen(
          args.topic,
          key: args.key,
        ),
      );
    },
    RankingRoute.name: (routeData) {
      final args = routeData.argsAs<RankingRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.RankingScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.ResetPasswordScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SplashScreen(),
      );
    },
    TopicRoute.name: (routeData) {
      final args = routeData.argsAs<TopicRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.TopicScreen(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    TopicsRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.TopicsScreen(),
      );
    },
    TypingLearningRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.TypingLearningScreen(),
      );
    },
    TypingResultRoute.name: (routeData) {
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.TypingResultScreen(),
      );
    },
    TypingRoute.name: (routeData) {
      final args = routeData.argsAs<TypingRouteArgs>();
      return _i35.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.TypingScreen(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTopicsToFolderScreen]
class AddTopicsToFolderRoute
    extends _i35.PageRouteInfo<AddTopicsToFolderRouteArgs> {
  AddTopicsToFolderRoute({
    _i36.Key? key,
    required _i37.TopicListModel topicList,
    required String folderId,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          AddTopicsToFolderRoute.name,
          args: AddTopicsToFolderRouteArgs(
            key: key,
            topicList: topicList,
            folderId: folderId,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTopicsToFolderRoute';

  static const _i35.PageInfo<AddTopicsToFolderRouteArgs> page =
      _i35.PageInfo<AddTopicsToFolderRouteArgs>(name);
}

class AddTopicsToFolderRouteArgs {
  const AddTopicsToFolderRouteArgs({
    this.key,
    required this.topicList,
    required this.folderId,
  });

  final _i36.Key? key;

  final _i37.TopicListModel topicList;

  final String folderId;

  @override
  String toString() {
    return 'AddTopicsToFolderRouteArgs{key: $key, topicList: $topicList, folderId: $folderId}';
  }
}

/// generated route for
/// [_i2.AppScreen]
class AppRoute extends _i35.PageRouteInfo<void> {
  const AppRoute({List<_i35.PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AuthenticationScreen]
class AuthenticationRoute extends _i35.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i35.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChangePasswordScreen]
class ChangePasswordRoute extends _i35.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i35.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CreateFolderScreen]
class CreateFolderRoute extends _i35.PageRouteInfo<void> {
  const CreateFolderRoute({List<_i35.PageRouteInfo>? children})
      : super(
          CreateFolderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateFolderRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CreateScreen]
class CreateRoute extends _i35.PageRouteInfo<void> {
  const CreateRoute({List<_i35.PageRouteInfo>? children})
      : super(
          CreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreateTopicScreen]
class CreateTopicRoute extends _i35.PageRouteInfo<void> {
  const CreateTopicRoute({List<_i35.PageRouteInfo>? children})
      : super(
          CreateTopicRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTopicRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i8.EditFolderScreen]
class EditFolderRoute extends _i35.PageRouteInfo<EditFolderRouteArgs> {
  EditFolderRoute({
    _i36.Key? key,
    required _i38.FolderModel folder,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          EditFolderRoute.name,
          args: EditFolderRouteArgs(
            key: key,
            folder: folder,
          ),
          initialChildren: children,
        );

  static const String name = 'EditFolderRoute';

  static const _i35.PageInfo<EditFolderRouteArgs> page =
      _i35.PageInfo<EditFolderRouteArgs>(name);
}

class EditFolderRouteArgs {
  const EditFolderRouteArgs({
    this.key,
    required this.folder,
  });

  final _i36.Key? key;

  final _i38.FolderModel folder;

  @override
  String toString() {
    return 'EditFolderRouteArgs{key: $key, folder: $folder}';
  }
}

/// generated route for
/// [_i9.EditTopicScreen]
class EditTopicRoute extends _i35.PageRouteInfo<EditTopicRouteArgs> {
  EditTopicRoute({
    _i36.Key? key,
    required _i39.TopicModel topicModel,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          EditTopicRoute.name,
          args: EditTopicRouteArgs(
            key: key,
            topicModel: topicModel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTopicRoute';

  static const _i35.PageInfo<EditTopicRouteArgs> page =
      _i35.PageInfo<EditTopicRouteArgs>(name);
}

class EditTopicRouteArgs {
  const EditTopicRouteArgs({
    this.key,
    required this.topicModel,
  });

  final _i36.Key? key;

  final _i39.TopicModel topicModel;

  @override
  String toString() {
    return 'EditTopicRouteArgs{key: $key, topicModel: $topicModel}';
  }
}

/// generated route for
/// [_i10.FlashcardsLearningScreen]
class FlashcardsLearningRoute extends _i35.PageRouteInfo<void> {
  const FlashcardsLearningRoute({List<_i35.PageRouteInfo>? children})
      : super(
          FlashcardsLearningRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlashcardsLearningRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i11.FlashcardsResultScreen]
class FlashcardsResultRoute extends _i35.PageRouteInfo<void> {
  const FlashcardsResultRoute({List<_i35.PageRouteInfo>? children})
      : super(
          FlashcardsResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlashcardsResultRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i12.FlashcardsScreen]
class FlashcardsRoute extends _i35.PageRouteInfo<FlashcardsRouteArgs> {
  FlashcardsRoute({
    required _i39.TopicModel topic,
    _i36.Key? key,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          FlashcardsRoute.name,
          args: FlashcardsRouteArgs(
            topic: topic,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FlashcardsRoute';

  static const _i35.PageInfo<FlashcardsRouteArgs> page =
      _i35.PageInfo<FlashcardsRouteArgs>(name);
}

class FlashcardsRouteArgs {
  const FlashcardsRouteArgs({
    required this.topic,
    this.key,
  });

  final _i39.TopicModel topic;

  final _i36.Key? key;

  @override
  String toString() {
    return 'FlashcardsRouteArgs{topic: $topic, key: $key}';
  }
}

/// generated route for
/// [_i13.FolderScreen]
class FolderRoute extends _i35.PageRouteInfo<FolderRouteArgs> {
  FolderRoute({
    _i36.Key? key,
    required _i38.FolderModel folder,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          FolderRoute.name,
          args: FolderRouteArgs(
            key: key,
            folder: folder,
          ),
          initialChildren: children,
        );

  static const String name = 'FolderRoute';

  static const _i35.PageInfo<FolderRouteArgs> page =
      _i35.PageInfo<FolderRouteArgs>(name);
}

class FolderRouteArgs {
  const FolderRouteArgs({
    this.key,
    required this.folder,
  });

  final _i36.Key? key;

  final _i38.FolderModel folder;

  @override
  String toString() {
    return 'FolderRouteArgs{key: $key, folder: $folder}';
  }
}

/// generated route for
/// [_i14.FoldersScreen]
class FoldersRoute extends _i35.PageRouteInfo<void> {
  const FoldersRoute({List<_i35.PageRouteInfo>? children})
      : super(
          FoldersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoldersRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i35.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i35.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i16.HomeScreen]
class HomeRoute extends _i35.PageRouteInfo<void> {
  const HomeRoute({List<_i35.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i17.LibraryScreen]
class LibraryRoute extends _i35.PageRouteInfo<void> {
  const LibraryRoute({List<_i35.PageRouteInfo>? children})
      : super(
          LibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i18.LogInScreen]
class LogInRoute extends _i35.PageRouteInfo<void> {
  const LogInRoute({List<_i35.PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i19.OTPScreen]
class OTPRoute extends _i35.PageRouteInfo<void> {
  const OTPRoute({List<_i35.PageRouteInfo>? children})
      : super(
          OTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ProfileScreen]
class ProfileRoute extends _i35.PageRouteInfo<void> {
  const ProfileRoute({List<_i35.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i21.PublicTopicScreen]
class PublicTopicRoute extends _i35.PageRouteInfo<PublicTopicRouteArgs> {
  PublicTopicRoute({
    _i36.Key? key,
    required _i39.TopicModel topic,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          PublicTopicRoute.name,
          args: PublicTopicRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'PublicTopicRoute';

  static const _i35.PageInfo<PublicTopicRouteArgs> page =
      _i35.PageInfo<PublicTopicRouteArgs>(name);
}

class PublicTopicRouteArgs {
  const PublicTopicRouteArgs({
    this.key,
    required this.topic,
  });

  final _i36.Key? key;

  final _i39.TopicModel topic;

  @override
  String toString() {
    return 'PublicTopicRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [_i22.PublicTopicsScreen]
class PublicTopicsRoute extends _i35.PageRouteInfo<void> {
  const PublicTopicsRoute({List<_i35.PageRouteInfo>? children})
      : super(
          PublicTopicsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublicTopicsRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i23.QuizzedResultScreen]
class QuizzedResultRoute extends _i35.PageRouteInfo<void> {
  const QuizzedResultRoute({List<_i35.PageRouteInfo>? children})
      : super(
          QuizzedResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizzedResultRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i24.QuizzesLearningScreen]
class QuizzesLearningRoute extends _i35.PageRouteInfo<void> {
  const QuizzesLearningRoute({List<_i35.PageRouteInfo>? children})
      : super(
          QuizzesLearningRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizzesLearningRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i25.QuizzesScreen]
class QuizzesRoute extends _i35.PageRouteInfo<QuizzesRouteArgs> {
  QuizzesRoute({
    required _i39.TopicModel topic,
    _i36.Key? key,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          QuizzesRoute.name,
          args: QuizzesRouteArgs(
            topic: topic,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizzesRoute';

  static const _i35.PageInfo<QuizzesRouteArgs> page =
      _i35.PageInfo<QuizzesRouteArgs>(name);
}

class QuizzesRouteArgs {
  const QuizzesRouteArgs({
    required this.topic,
    this.key,
  });

  final _i39.TopicModel topic;

  final _i36.Key? key;

  @override
  String toString() {
    return 'QuizzesRouteArgs{topic: $topic, key: $key}';
  }
}

/// generated route for
/// [_i26.RankingScreen]
class RankingRoute extends _i35.PageRouteInfo<RankingRouteArgs> {
  RankingRoute({
    _i36.Key? key,
    required String id,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          RankingRoute.name,
          args: RankingRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'RankingRoute';

  static const _i35.PageInfo<RankingRouteArgs> page =
      _i35.PageInfo<RankingRouteArgs>(name);
}

class RankingRouteArgs {
  const RankingRouteArgs({
    this.key,
    required this.id,
  });

  final _i36.Key? key;

  final String id;

  @override
  String toString() {
    return 'RankingRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i27.ResetPasswordScreen]
class ResetPasswordRoute extends _i35.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i35.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SignUpScreen]
class SignUpRoute extends _i35.PageRouteInfo<void> {
  const SignUpRoute({List<_i35.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SplashScreen]
class SplashRoute extends _i35.PageRouteInfo<void> {
  const SplashRoute({List<_i35.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i30.TopicScreen]
class TopicRoute extends _i35.PageRouteInfo<TopicRouteArgs> {
  TopicRoute({
    _i36.Key? key,
    required _i39.TopicModel topic,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          TopicRoute.name,
          args: TopicRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TopicRoute';

  static const _i35.PageInfo<TopicRouteArgs> page =
      _i35.PageInfo<TopicRouteArgs>(name);
}

class TopicRouteArgs {
  const TopicRouteArgs({
    this.key,
    required this.topic,
  });

  final _i36.Key? key;

  final _i39.TopicModel topic;

  @override
  String toString() {
    return 'TopicRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [_i31.TopicsScreen]
class TopicsRoute extends _i35.PageRouteInfo<void> {
  const TopicsRoute({List<_i35.PageRouteInfo>? children})
      : super(
          TopicsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopicsRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i32.TypingLearningScreen]
class TypingLearningRoute extends _i35.PageRouteInfo<void> {
  const TypingLearningRoute({List<_i35.PageRouteInfo>? children})
      : super(
          TypingLearningRoute.name,
          initialChildren: children,
        );

  static const String name = 'TypingLearningRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i33.TypingResultScreen]
class TypingResultRoute extends _i35.PageRouteInfo<void> {
  const TypingResultRoute({List<_i35.PageRouteInfo>? children})
      : super(
          TypingResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'TypingResultRoute';

  static const _i35.PageInfo<void> page = _i35.PageInfo<void>(name);
}

/// generated route for
/// [_i34.TypingScreen]
class TypingRoute extends _i35.PageRouteInfo<TypingRouteArgs> {
  TypingRoute({
    _i36.Key? key,
    required _i39.TopicModel topic,
    List<_i35.PageRouteInfo>? children,
  }) : super(
          TypingRoute.name,
          args: TypingRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TypingRoute';

  static const _i35.PageInfo<TypingRouteArgs> page =
      _i35.PageInfo<TypingRouteArgs>(name);
}

class TypingRouteArgs {
  const TypingRouteArgs({
    this.key,
    required this.topic,
  });

  final _i36.Key? key;

  final _i39.TopicModel topic;

  @override
  String toString() {
    return 'TypingRouteArgs{key: $key, topic: $topic}';
  }
}
