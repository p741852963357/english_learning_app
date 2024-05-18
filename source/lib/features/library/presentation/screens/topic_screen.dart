import 'package:auto_route/auto_route.dart';
import 'package:client/core/local_storage.dart';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/home/domain/providers/user_public_topic_provider.dart';
import 'package:client/features/library/domain/providers/flashcards_provider.dart';
import 'package:client/features/library/domain/usecases/topic_usecase.dart';
import 'package:client/features/library/presentation/widgets/learning_button.dart';
import 'package:client/features/library/presentation/widgets/option_widget.dart';
import 'package:client/features/library/presentation/widgets/vocabulary_widget.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../domain/providers/topic_list_provider.dart';
import '../widgets/delete_topic_dialog.dart';

@RoutePage()
class TopicScreen extends StatefulWidget {
  final TopicModel topic;

  const TopicScreen({super.key, required this.topic});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  late String userEmail;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    LocalStorage localStorage = LocalStorage();
    userEmail = await localStorage.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
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
                    return userEmail == widget.topic.owner
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                OptionWidget(
                                  icon: const Icon(Icons.edit),
                                  title: 'Edit topic',
                                  onTap: () {
                                    AutoRouter.of(context).push(EditTopicRoute(topicModel: widget.topic));
                                  },
                                ),
                                Consumer(
                                  builder: (context, ref, child) {
                                    return OptionWidget(
                                      icon: Icon(widget.topic.visibility ? Icons.visibility_off : Icons.visibility),
                                      title: widget.topic.visibility ? 'Set private' : 'Set public',
                                      onTap: () {
                                        TopicUseCase().editTopicVisibility(widget.topic, !widget.topic.visibility).then((value) {
                                          ref.read(topicListProvider.notifier).refresh();
                                          TopicModel topic = value;
                                          context.router.replace(TopicRoute(topic: topic));
                                        });
                                      },
                                    );
                                  },
                                ),
                                OptionWidget(
                                  icon: const Icon(Icons.delete),
                                  title: 'Delete topic',
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => DeleteTopicDialog(
                                        id: widget.topic.id.toString(),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Consumer(
                                  builder: (context, ref, child) {
                                    final data = ref.watch(userPublicTopicsProvider);
                                    return data.when(
                                        data: (data) {
                                          bool isTopicInUserList = data.contain(widget.topic);
                                          return isTopicInUserList
                                              ? OptionWidget(
                                                  icon: const Icon(Icons.delete),
                                                  title: 'Remove topic',
                                                  onTap: () {},
                                                )
                                              : OptionWidget(
                                                  icon: const Icon(Icons.add),
                                                  title: 'Save topic',
                                                  onTap: () {},
                                                );
                                        },
                                        loading: () => Container(),
                                        error: (Object error, StackTrace stackTrace) => Container());
                                  },
                                ),
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
                      ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies);
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
                      ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies);
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
                      ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies);
                      AutoRouter.of(context).push(
                        TypingRoute(topic: widget.topic),
                      );
                    },
                    title: "Typing practice",
                    prefixIcon: Icons.keyboard_outlined);
              },
            ),
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
                return VocabularyWidget(
                  term: widget.topic.vocabularies[index].term,
                  definition: widget.topic.vocabularies[index].definition,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
