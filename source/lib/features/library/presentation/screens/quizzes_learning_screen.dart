import 'package:auto_route/auto_route.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../domain/providers/flashcards_provider.dart';

@RoutePage()
class QuizzesLearningScreen extends ConsumerStatefulWidget {
  const QuizzesLearningScreen({super.key});

  @override
  ConsumerState<QuizzesLearningScreen> createState() => _QuizzesLearningScreenState();
}

class _QuizzesLearningScreenState extends ConsumerState<QuizzesLearningScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(flashcardsProvider);
    List<int> answers = data.getShuffleAnswers();
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  data.index < data.length ? data.vocabularies[data.index].term : "",
                  style: const TextStyle(fontSize: 36, color: AppColors.black),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: answers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => answers[index] == data.index
                          ? AlertDialog(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                              backgroundColor: AppColors.white,
                              title: Text(
                                "Correct",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.green.shade600,
                                ),
                              ),
                              content: Text(
                                data.vocabularies[data.index].definition,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              backgroundColor: AppColors.white,
                              title: Text(
                                "Incorrect",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.red.shade600,
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Correct answer:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green.shade600,
                                    ),
                                  ),
                                  Text(
                                    data.vocabularies[data.index].definition,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "Your answer:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red.shade600,
                                    ),
                                  ),
                                  Text(
                                    data.vocabularies[answers[index]].definition,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ).then((value) {
                      if (answers[index] == data.index) {
                        ref.read(flashcardsProvider.notifier).increaseTrueNum();
                      } else {
                        ref.read(flashcardsProvider.notifier).increaseFalseNum();
                      }
                      if (data.index == data.length - 1) {
                        AutoRouter.of(context).replace(const QuizzedResultRoute());
                      }
                      ref.read(flashcardsProvider.notifier).increaseIndex();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.grey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      data.index < data.length ? data.vocabularies[answers[index]].definition : "",
                      style: const TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
