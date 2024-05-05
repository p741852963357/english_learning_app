import 'package:client/features/create/domain/entities/vocabulary.dart';

class Topic {
  final String title;
  final List<Vocabulary> vocabularyList;

  Topic({required this.title, required this.vocabularyList});
}
