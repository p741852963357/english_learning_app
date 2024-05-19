import 'package:client/features/library/data/models/public_topic_list_model.dart';
import 'package:client/features/library/domain/providers/public_topic_list_notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final publicTopicListProvider = AutoDisposeAsyncNotifierProvider<PublicTopicListNotifier, PublicTopicListModel>(() {
  return PublicTopicListNotifier();
});
