import 'package:client/features/home/domain/providers/public_topics_notifier.dart';
import 'package:client/features/home/domain/providers/user_public_topic_notifier.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userPublicTopicsProvider = AutoDisposeAsyncNotifierProvider<UserPublicTopicNotifier, TopicListModel>(() {
  return UserPublicTopicNotifier();
});
