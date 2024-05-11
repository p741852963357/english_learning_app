class VocabularyModel {
  String term;
  String definition;

  VocabularyModel({required this.term, required this.definition});

  VocabularyModel.fromJson(json)
      : term = json['term'],
        definition = json['definition'];

  Map toJson() => {
        'term': term,
        'definition': definition,
      };
}
