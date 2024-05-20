import 'dart:async';

import 'package:client/features/library/features/public_topic/domain/usecases/public_topic_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/local_storage.dart';
import '../../data/models/public_topics_model.dart';

class PublicTopicsNotifier extends AutoDisposeAsyncNotifier<PublicTopicsModel> {
  Future<PublicTopicsModel> getData() async {
    LocalStorage localStorage = LocalStorage();
    String email = await localStorage.getUserInfo();
    return await PublicTopicUseCase().getUserPublicTopics(email);
  }

  @override
  Future<PublicTopicsModel> build() {
    return getData();
  }

  void refresh() {
    ref.invalidateSelf();
  }
}
