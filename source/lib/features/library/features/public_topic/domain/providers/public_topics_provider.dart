import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/public_topics_model.dart';
import 'public_topics_notifier.dart';

final publicTopicsProvider = AutoDisposeAsyncNotifierProvider<PublicTopicsNotifier, PublicTopicsModel>(() {
  return PublicTopicsNotifier();
});
