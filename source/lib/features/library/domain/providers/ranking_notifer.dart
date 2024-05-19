import 'package:client/features/create/data/models/vocabulary_model.dart';
import 'package:client/features/library/domain/entities/flashcards_entity.dart';
import 'package:client/features/library/domain/entities/raking_enitiy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RankingNotifier extends Notifier<Ranking> {
  @override
  Ranking build() {
    return Ranking(DateTime.now(), 0);
  }

  initState() {
    Ranking ranking = state.copyWith();
    ranking.now = DateTime.now();
    state = ranking;
  }
}
