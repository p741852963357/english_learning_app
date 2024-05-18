import 'package:client/features/library/data/models/topic_list_model.dart';

class FolderModel {
  String? id;
  String title;
  TopicListModel topicList;
  String owner;

  FolderModel(this.title, this.topicList, this.owner, this.id);

  FolderModel.fromJson(json)
      : owner = json['owner'],
        id = json['_id'],
        title = json['title'],
        topicList = TopicListModel.fromJson(json['topics']);

  Map toJson() => {
        'id': id,
        'title': title,
        'topics': topicList.toJson(),
      };
}
