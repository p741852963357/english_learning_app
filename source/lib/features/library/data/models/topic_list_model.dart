import 'dart:convert';

import '../../../create/data/models/topic_model.dart';

class TopicListModel {
  List<TopicModel> topicList;

  TopicListModel(this.topicList);

  int get length => topicList.length;

  TopicModel get(int index) => topicList[index];

  void addTopic(TopicModel topicModel) {
    topicList.add(topicModel);
  }

  bool contain(TopicModel topicModel) {
    return topicList.contains(topicModel);
  }

  factory TopicListModel.fromJson(json) {
    final list = json as List;
    List<TopicModel> topicList = list.map((item) => TopicModel.fromJson(item)).toList();

    return TopicListModel(topicList = topicList);
  }

  Map toJson() => {
        'topics': jsonEncode(topicList),
      };
}
