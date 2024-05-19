import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:client/core/local_storage.dart';

import 'package:client/features/library/domain/providers/flashcards_provider.dart';
import 'package:client/features/library/domain/providers/ranking_provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart';
import '../../../../constants/app_colors.dart';

import '../../../../core/api.dart';
import '../../../../core/app_exception.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../create/data/models/vocabulary_model.dart';
import '../../data/models/topic_list_model.dart';
import '../widgets/false_widget.dart';
import '../widgets/true_widget.dart';

@RoutePage()
class FlashcardsLearningScreen extends ConsumerStatefulWidget {
  const FlashcardsLearningScreen({super.key});

  @override
  ConsumerState<FlashcardsLearningScreen> createState() => _FlashcardsLearningScreenState();
}

class _FlashcardsLearningScreenState extends ConsumerState<FlashcardsLearningScreen> {
  final CardSwiperController cardSwiperController = CardSwiperController();
  late FlipCardController controller;
  bool autoPlay = false;
  FlutterTts flutterTts = FlutterTts();
  bool ttsState = false;

  @override
  void initState() {
    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = false;
      });
    });
    controller = FlipCardController();
    super.initState();
  }

  @override
  void dispose() {
    cardSwiperController.dispose();
    super.dispose();
  }

  Future<String> editTopic(String id, DateTime startTime, DateTime endTime) async {
    try {
      LocalStorage localStorage = LocalStorage();
      String email = await localStorage.getUserInfo();
      final body = jsonEncode({"id": id, "email": email, 'start': startTime.toIso8601String(), 'end': endTime.toIso8601String()});
      const endPoint = '/api/topics/ranking';
      final response = await put(
        Uri.parse(URL + endPoint),
        body: body,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return "";
      } else {
        throw AppException(message: data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final flashcards = ref.watch(flashcardsProvider);
    final ranking = ref.watch(rankingProvider);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FalseWidget(falseNum: flashcards.falseNum),
                TrueWidget(trueNum: flashcards.trueNum),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60, right: 20, left: 20, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60, right: 20, left: 20, bottom: 20),
            child: CardSwiper(
              onUndo: (int? previousIndex, int currentIndex, CardSwiperDirection direction) {
                if (direction.name == 'left') {
                  ref.read(flashcardsProvider.notifier).decreaseFalseNum();
                }
                if (direction.name == 'right') {
                  ref.read(flashcardsProvider.notifier).decreaseTrueNum();
                }
                ref.read(flashcardsProvider.notifier).decreaseIndex();
                return true;
              },
              onEnd: () {},
              onSwipe: (
                int previousIndex,
                int? currentIndex,
                CardSwiperDirection direction,
              ) {
                if (direction.name == 'left') {
                  ref.read(flashcardsProvider.notifier).increaseFalseNum();
                }
                if (direction.name == 'right') {
                  ref.read(flashcardsProvider.notifier).increaseTrueNum();
                }

                ref.read(flashcardsProvider.notifier).increaseIndex();
                if (flashcards.index + 1 == flashcards.vocabularies.length) {
                  final ranking = ref.watch(rankingProvider);
                  AutoRouter.of(context).replace(const FlashcardsResultRoute());
                  editTopic(flashcards.id, ranking.now, DateTime.now());
                }
                return true;
              },
              controller: cardSwiperController,
              allowedSwipeDirection: const AllowedSwipeDirection.symmetric(vertical: false, horizontal: true),
              padding: EdgeInsets.zero,
              numberOfCardsDisplayed: 1,
              cardsCount: flashcards.vocabularies.length,
              cardBuilder: (BuildContext context, int index, int horizontalOffsetPercentage, int verticalOffsetPercentage) {
                return FlipCard(
                  controller: controller,
                  front: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey, width: 4),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          flashcards.vocabularies[index].term.isNotEmpty ? flashcards.vocabularies[index].term : '...',
                          style: const TextStyle(fontSize: 42),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: IconButton(
                            onPressed: ttsState
                                ? null
                                : () async {
                                    var result = await flutterTts.speak(flashcards.vocabularies[index].term);
                                    if (result == 1) {
                                      setState(() {
                                        ttsState = true;
                                      });
                                    }
                                  },
                            icon: const Icon(Icons.volume_up_outlined)),
                      )
                    ],
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey, width: 4),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      flashcards.vocabularies[index].definition.isNotEmpty ? flashcards.vocabularies[index].definition : '...',
                      style: const TextStyle(fontSize: 42),
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: AppColors.lightGrey,
        color: AppColors.lightGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: flashcards.index == 0
                  ? null
                  : () {
                      setState(() {
                        cardSwiperController.undo();
                      });
                    },
              icon: const Icon(
                Icons.turn_left_rounded,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () async {
                setState(() {
                  autoPlay = !autoPlay;
                });
                if (autoPlay) {
                  int i = flashcards.index;
                  while (i < flashcards.vocabularies.length && autoPlay) {
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      ttsState = true;
                    });
                    await flutterTts.speak(flashcards.vocabularies[i].term);
                    await Future.delayed(const Duration(seconds: 2));
                    if (autoPlay) {
                      cardSwiperController.swipe(CardSwiperDirection.left);
                      setState(() {
                        i += 1;
                      });
                    }
                  }
                }
              },
              icon: Icon(
                autoPlay ? Icons.pause_rounded : Icons.play_arrow_rounded,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
