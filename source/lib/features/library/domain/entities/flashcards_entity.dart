import 'dart:math';

import '../../../create/data/models/vocabulary_model.dart';

class Flashcards {
  List<VocabularyModel> vocabularies;
  int trueNum;
  int falseNum;
  int index;

  Flashcards(this.vocabularies, this.trueNum, this.falseNum, this.index);

  int get length => vocabularies.length;

  List<int> getShuffleAnswers() {
    if (vocabularies.length < 4) {
      List<int> lst = List<int>.generate(vocabularies.length, (index) => index);
      return lst..shuffle();
    } else {
      List<int> lst = [];
      var random = Random();
      lst.add(index);
      while (lst.length != 4) {
        int r = random.nextInt(vocabularies.length);
        if (lst.contains(r) == false) {
          lst.add(r);
        }
      }
      return lst..shuffle();
    }
  }

  Flashcards copyWith({List<VocabularyModel>? vocabularies, int? trueNum, int? falseNum, int? index}) {
    return Flashcards(
      vocabularies ?? this.vocabularies,
      trueNum ?? this.trueNum,
      falseNum ?? this.falseNum,
      index ?? this.index,
    );
  }
}
