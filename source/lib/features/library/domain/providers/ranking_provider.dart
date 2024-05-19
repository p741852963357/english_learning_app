import 'package:client/features/library/domain/entities/raking_enitiy.dart';
import 'package:client/features/library/domain/providers/ranking_notifer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rankingProvider = NotifierProvider<RankingNotifier, Ranking>(() {
  return RankingNotifier();
});
