import 'dart:async';

import 'package:client/features/library/data/models/public_topic_list_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/local_storage.dart';
import '../usecases/topic_usecase.dart';

class PublicTopicListNotifier extends AutoDisposeAsyncNotifier<PublicTopicListModel> {
  Future<PublicTopicListModel> getData() async {
    LocalStorage localStorage = LocalStorage();
    String email = await localStorage.getUserInfo();
    return await TopicUseCase().getUserPublicTopics(email);
  }

  @override
  Future<PublicTopicListModel> build() {
    return getData();
  }

  void refresh() {
    ref.invalidateSelf();
  }
}
