class VocabularyModel {
  String term;
  String definition;
  bool star;

  VocabularyModel({required this.term, required this.definition, required this.star});

  VocabularyModel.fromJson(json)
      : term = json['term'],
        star = json['star'],
        definition = json['definition'];

  Map toJson() => {'term': term, 'definition': definition, 'star': star};
}
