import 'package:client/features/create/data/models/vocabulary_model.dart';
import 'package:client/features/library/domain/entities/flashcards_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlashcardsNotifier extends Notifier<Flashcards> {
  @override
  Flashcards build() {
    return Flashcards([], 0, 0, 0, "");
  }

  initState(List<VocabularyModel> vocabularies, String id) {
    Flashcards flashcards = state.copyWith();
    flashcards.vocabularies = vocabularies;
    flashcards.index = 0;
    flashcards.trueNum = 0;
    flashcards.falseNum = 0;
    flashcards.id = id;
    state = flashcards;
  }

  switchCard() {
    Flashcards flashcards = state.copyWith();
    List<VocabularyModel> v = [];
    for (VocabularyModel vocabulary in flashcards.vocabularies) {
      v.add(VocabularyModel(term: vocabulary.definition, definition: vocabulary.term, star: vocabulary.star));
    }
    flashcards.vocabularies = v;
    flashcards.index = 0;
    flashcards.trueNum = 0;
    flashcards.falseNum = 0;
    state = flashcards;
  }

  shuffle() {
    Flashcards flashcards = state.copyWith();
    List<VocabularyModel> v = flashcards.vocabularies;
    v.shuffle();
    flashcards.vocabularies = v;
    flashcards.index = 0;
    flashcards.trueNum = 0;
    flashcards.falseNum = 0;
    state = flashcards;
  }

  void reset() {
    Flashcards flashcards = state.copyWith();
    flashcards.index = 0;
    flashcards.trueNum = 0;
    flashcards.falseNum = 0;
    state = flashcards;
  }

  int get length => state.vocabularies.length;

  int get trueNum => state.trueNum;

  int get falseNum => state.falseNum;

  getVocabularies() {
    return state.vocabularies;
  }

  void increaseIndex() {
    Flashcards flashcards = state.copyWith();
    flashcards.index++;
    state = flashcards;
  }

  void decreaseIndex() {
    if (state.index > 0) {
      Flashcards flashcards = state.copyWith();
      flashcards.index--;
      state = flashcards;
    }
  }

  void decreaseFalseNum() {
    Flashcards flashcards = state.copyWith();
    flashcards.falseNum--;
    state = flashcards;
  }

  void increaseTrueNum() {
    Flashcards flashcards = state.copyWith();
    flashcards.trueNum++;
    state = flashcards;
  }

  void decreaseTrueNum() {
    Flashcards flashcards = state.copyWith();
    flashcards.trueNum--;
    state = flashcards;
  }

  void increaseFalseNum() {
    Flashcards flashcards = state.copyWith();
    flashcards.falseNum++;
    state = flashcards;
  }
}
