import 'dart:async';

import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/local_storage.dart';
import '../usecases/topic_usecase.dart';

class TopicListNotifier extends AutoDisposeAsyncNotifier<TopicListModel> {
  Future<TopicListModel> getData() async {
    LocalStorage localStorage = LocalStorage();
    String email = await localStorage.getUserInfo();
    return await TopicUseCase().getTopics(email);
  }

  @override
  Future<TopicListModel> build() {
    return getData();
  }

  void refresh() {
    ref.invalidateSelf();
  }

  void addTopic(TopicModel topicModel) {}
}
