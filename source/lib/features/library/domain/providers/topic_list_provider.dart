import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:client/features/library/domain/providers/topic_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topicListProvider = AutoDisposeAsyncNotifierProvider<TopicListNotifier, TopicListModel>(() {
  return TopicListNotifier();
});
