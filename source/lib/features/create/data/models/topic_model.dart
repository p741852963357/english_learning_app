import 'dart:convert';
import 'package:client/features/create/data/models/vocabulary_model.dart';

class TopicModel {
  String? id;
  String title;
  List<VocabularyModel> vocabularies;
  bool visibility;
  String owner;

  int get length => vocabularies.length;

  TopicModel({
    required this.title,
    this.visibility = false,
    required this.vocabularies,
    required this.owner,
    this.id,
  });

  TopicModel.fromJson(json)
      : title = json['title'],
        id = json['_id'],
        visibility = json['visibility'],
        owner = json['owner'],
        vocabularies = (json['vocabularies'] as List).map((e) => VocabularyModel.fromJson(e)).toList();

  Map toJson() => {
        'vocabularies': jsonEncode(vocabularies),
        'title': title,
        'visibility': visibility,
        'owner': owner,
      };
}
