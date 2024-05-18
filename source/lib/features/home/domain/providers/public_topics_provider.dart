import 'package:client/features/home/domain/providers/public_topics_notifier.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final publicTopicsProvider = AutoDisposeAsyncNotifierProvider<PublicTopicsNotifier, TopicListModel>(() {
  return PublicTopicsNotifier();
});
