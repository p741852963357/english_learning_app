import 'package:client/features/library/domain/entities/flashcards_entity.dart';
import 'package:client/features/library/domain/providers/flashcards_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flashcardsProvider = NotifierProvider<FlashcardsNotifier, Flashcards>(() {
  return FlashcardsNotifier();
});
