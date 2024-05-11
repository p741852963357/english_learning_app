import 'package:client/core/local_storage.dart';
import 'package:client/features/create/data/datasources/topic_creation_remote_data_source.dart';

import '../../data/models/topic_model.dart';
import '../../data/models/vocabulary_model.dart';

class TopicCreationUseCase {
  TopicCreationRemoteDaraSource topicCreationRemoteDaraSource = TopicCreationRemoteDaraSource();

  Future<TopicModel> createTopic(String title, List<VocabularyModel> vocabularies) async {
    try {
      final owner = await LocalStorage().getUserInfo();
      return await topicCreationRemoteDaraSource.createTopic(TopicModel(title: title, vocabularies: vocabularies, owner: owner));
    } catch (e) {
      return Future.error(e);
    }
  }
}
