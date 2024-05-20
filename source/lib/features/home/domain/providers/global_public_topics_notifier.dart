import 'dart:async';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:client/features/library/features/public_topic/domain/usecases/public_topic_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/local_storage.dart';

class GlobalPublicTopicsNotifier extends AutoDisposeAsyncNotifier<TopicListModel> {
  Future<TopicListModel> getData() async {
    LocalStorage localStorage = LocalStorage();
    String email = await localStorage.getUserInfo();
    return await PublicTopicUseCase().getPublicTopics(email);
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
