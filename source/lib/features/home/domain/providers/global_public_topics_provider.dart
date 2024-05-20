import 'package:client/features/home/domain/providers/global_public_topics_notifier.dart';

import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalPublicTopicsProvider = AutoDisposeAsyncNotifierProvider<GlobalPublicTopicsNotifier, TopicListModel>(() {
  return GlobalPublicTopicsNotifier();
});
