import 'package:auto_route/auto_route.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../domain/providers/flashcards_provider.dart';

@RoutePage()
class TypingLearningScreen extends ConsumerStatefulWidget {
  const TypingLearningScreen({super.key});

  @override
  ConsumerState<TypingLearningScreen> createState() => _TypingLearningScreenState();
}

class _TypingLearningScreenState extends ConsumerState<TypingLearningScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(flashcardsProvider);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Text(
          data.index < data.length ? data.vocabularies[data.index].term : "",
          style: const TextStyle(fontSize: 36, color: AppColors.black),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: AppColors.lightGrey,
        color: AppColors.lightGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                cursorColor: AppColors.black,
                minLines: 1,
                maxLines: 2,
                onChanged: (data) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  suffix: controller.text.isEmpty
                      ? TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: const Text(
                            "Don't know",
                            style: TextStyle(color: AppColors.blue),
                          ),
                        )
                      : const Text(""),
                  hintText: "Type the definition",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black, width: 2),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black, width: 4),
                  ),
                ),
                autofocus: true,
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: controller.text.isNotEmpty
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) => controller.text.trim().toLowerCase() == data.vocabularies[data.index].definition.trim().toLowerCase()
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
                                      controller.text,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ).then((value) {
                        if (controller.text.trim().toLowerCase() == data.vocabularies[data.index].definition.trim().toLowerCase()) {
                          ref.read(flashcardsProvider.notifier).increaseTrueNum();
                        } else {
                          ref.read(flashcardsProvider.notifier).increaseFalseNum();
                        }
                        if (data.index == data.length - 1) {
                          AutoRouter.of(context).replace(const TypingResultRoute());
                        }
                        ref.read(flashcardsProvider.notifier).increaseIndex();
                        controller.clear();
                      });
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
                shadowColor: Colors.transparent,
                backgroundColor: AppColors.blue,
              ),
              child: const Icon(
                Icons.arrow_upward,
                size: 20,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
