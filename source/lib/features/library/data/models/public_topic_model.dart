import '../../../create/data/models/topic_model.dart';
import '../../../create/data/models/vocabulary_model.dart';

class PublicTopicModel {
  TopicModel topic;
  List<VocabularyModel> starVocabularies;
  String userEmail;

  PublicTopicModel(this.topic, this.starVocabularies, this.userEmail);

  factory PublicTopicModel.fromJson(json) {
    final topic = TopicModel.fromJson(json['topicId']);
    List<VocabularyModel> starVocabulary = (json['starVocabularies'] as List).map((e) => VocabularyModel.fromJson(e)).toList();
    String userEmail = json['userEmail'];
    return PublicTopicModel(topic, starVocabulary, userEmail);
  }
}
