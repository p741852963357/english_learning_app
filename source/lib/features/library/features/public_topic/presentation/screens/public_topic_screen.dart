import 'package:auto_route/auto_route.dart';
import 'package:client/features/library/features/public_topic/domain/usecases/public_topic_usecase.dart';
import 'package:client/features/library/features/public_topic/presentation/widget/public_vocabulary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../routes/app_router.gr.dart';
import '../../../../../create/data/models/topic_model.dart';
import '../../../../domain/providers/flashcards_provider.dart';
import '../../../../domain/providers/ranking_provider.dart';
import '../../../../presentation/widgets/learning_button.dart';
import '../../../../presentation/widgets/option_widget.dart';
import '../../domain/providers/public_topics_provider.dart';

@RoutePage()
class PublicTopicScreen extends ConsumerStatefulWidget {
  final TopicModel topic;
  const PublicTopicScreen({super.key, required this.topic});

  @override
  ConsumerState<PublicTopicScreen> createState() => _PublicTopicScreenState();
}

class _PublicTopicScreenState extends ConsumerState<PublicTopicScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(publicTopicsProvider);

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          OptionWidget(
                            icon: const Icon(Icons.leaderboard),
                            title: 'View ranking',
                            onTap: () {
                              AutoRouter.of(context).push(RankingRoute(id: widget.topic.id.toString()));
                            },
                          ),
                          data.when(
                              data: (data) {
                                return data.contains(widget.topic)
                                    ? OptionWidget(
                                        icon: const Icon(Icons.delete),
                                        title: 'Remove topic',
                                        onTap: () {
                                          PublicTopicUseCase().removeUserPublicTopics(widget.topic.id.toString());
                                          AutoRouter.of(context).maybePop();
                                          ref.read(publicTopicsProvider.notifier).refresh();
                                        },
                                      )
                                    : OptionWidget(
                                        icon: const Icon(Icons.add),
                                        title: 'Save topic',
                                        onTap: () {
                                          PublicTopicUseCase().savePublicTopic(widget.topic.id.toString());
                                          ref.read(publicTopicsProvider.notifier).refresh();
                                        },
                                      );
                              },
                              loading: () => Container(),
                              error: (Object error, StackTrace stackTrace) => Container()),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.more_horiz_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.topic.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    widget.topic.owner,
                    style: const TextStyle(fontSize: 13),
                  ),
                  SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      width: 30,
                      thickness: 1,
                      color: AppColors.grey.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    '${widget.topic.vocabularies.length.toString()} terms',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.strongGrey,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return LearningButton(
                      onPressed: () {
                        ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies, widget.topic.id.toString());
                        AutoRouter.of(context).push(
                          FlashcardsRoute(topic: widget.topic),
                        );
                      },
                      title: "Flashcards",
                      prefixIcon: Icons.flip_rounded);
                },
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return LearningButton(
                      onPressed: () {
                        ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies, widget.topic.id.toString());
                        ref.read(rankingProvider.notifier).initState();
                        AutoRouter.of(context).push(
                          QuizzesRoute(topic: widget.topic),
                        );
                      },
                      title: "Quiz",
                      prefixIcon: Icons.radio_button_checked);
                },
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return LearningButton(
                      onPressed: () {
                        ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies, widget.topic.id.toString());
                        ref.read(rankingProvider.notifier).initState();
                        AutoRouter.of(context).push(
                          TypingRoute(topic: widget.topic),
                        );
                      },
                      title: "Typing practice",
                      prefixIcon: Icons.keyboard_outlined);
                },
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              const Text(
                "Terms",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.topic.vocabularies.length,
                itemBuilder: (context, index) {
                  return PublicVocabularyWidget(
                    term: widget.topic.vocabularies[index].term,
                    definition: widget.topic.vocabularies[index].definition,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
