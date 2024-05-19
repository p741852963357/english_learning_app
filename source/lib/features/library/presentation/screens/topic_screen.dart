import 'package:auto_route/auto_route.dart';
import 'package:client/core/local_storage.dart';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/create/data/models/vocabulary_model.dart';
import 'package:client/features/library/domain/providers/flashcards_provider.dart';
import 'package:client/features/library/domain/providers/ranking_provider.dart';

import 'package:client/features/library/domain/usecases/topic_usecase.dart';
import 'package:client/features/library/presentation/widgets/learning_button.dart';
import 'package:client/features/library/presentation/widgets/option_widget.dart';
import 'package:client/features/library/presentation/widgets/vocabulary_widget.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_colors.dart';
import '../../domain/providers/public_topic_list_provider.dart';
import '../../domain/providers/topic_list_provider.dart';
import '../widgets/delete_topic_dialog.dart';
import '../widgets/vocabulary_widget2.dart';
import '../widgets/vocabulary_widget3.dart';

@RoutePage()
class TopicScreen extends ConsumerStatefulWidget {
  final TopicModel topic;

  const TopicScreen({super.key, required this.topic});

  @override
  ConsumerState<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends ConsumerState<TopicScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<VocabularyModel> starVocabulary = [];
  int _previousTabIndex = 0;
  String userEmail = "";

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(listenToTabChanges);
    getUser();
    for (VocabularyModel vocabulary in widget.topic.vocabularies) {
      if (vocabulary.star == true) {
        setState(() {
          starVocabulary.add(vocabulary);
        });
      }
    }
    super.initState();
  }

  void listenToTabChanges() {
    if (_previousTabIndex != tabController.index) {
      setState(() {
        _previousTabIndex = tabController.index;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController.removeListener(listenToTabChanges);
    tabController.dispose();
  }

  Future<void> getUser() async {
    LocalStorage localStorage = LocalStorage();
    String email = await localStorage.getUserInfo();
    setState(() {
      userEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(publicTopicListProvider);
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
                                data.when(
                                    data: (data) {
                                      bool isTopicInUserList = data.contains(widget.topic);
                                      return isTopicInUserList
                                          ? OptionWidget(
                                              icon: const Icon(Icons.delete),
                                              title: 'Remove topic',
                                              onTap: () {
                                                TopicUseCase().removeUserPublicTopics(widget.topic.id.toString());
                                                ref.read(publicTopicListProvider.notifier).refresh();
                                              },
                                            )
                                          : OptionWidget(
                                              icon: const Icon(Icons.add),
                                              title: 'Save topic',
                                              onTap: () {
                                                TopicUseCase().saveTopic(widget.topic.id.toString());
                                                ref.read(publicTopicListProvider.notifier).refresh();
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
                        if (tabController.index == 0) {
                          ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies, widget.topic.id.toString());
                        } else {
                          ref.read(flashcardsProvider.notifier).initState(starVocabulary, widget.topic.id.toString());
                        }
                        ref.read(rankingProvider.notifier).initState();
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
                        if (tabController.index == 0) {
                          ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies, widget.topic.id.toString());
                        } else {
                          ref.read(flashcardsProvider.notifier).initState(starVocabulary, widget.topic.id.toString());
                        }
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
                        if (tabController.index == 0) {
                          ref.read(flashcardsProvider.notifier).initState(widget.topic.vocabularies, widget.topic.id.toString());
                        } else {
                          ref.read(flashcardsProvider.notifier).initState(starVocabulary, widget.topic.id.toString());
                        }
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
              starVocabulary.isEmpty
                  ? const SizedBox()
                  : Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade300,
                      ),
                      child: TabBar(
                        indicatorColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        dividerColor: Colors.transparent,
                        padding: const EdgeInsets.all(2),
                        labelStyle: const TextStyle(fontSize: 14),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'Study all',
                          ),
                          Tab(
                            text: 'Study favourites',
                          ),
                        ],
                      ),
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
              tabController.index == 0 || starVocabulary.isEmpty
                  ? ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.topic.vocabularies.length,
                      itemBuilder: (context, index) {
                        return userEmail == widget.topic.owner
                            ? VocabularyWidget(
                                onPress: () {
                                  widget.topic.vocabularies[index].star = !widget.topic.vocabularies[index].star;
                                  TopicUseCase().editTopic(widget.topic.title, widget.topic.vocabularies, widget.topic.id.toString());
                                  if (widget.topic.vocabularies[index].star) {
                                    setState(() {
                                      starVocabulary.add(widget.topic.vocabularies[index]);
                                    });
                                  } else {
                                    setState(() {
                                      starVocabulary.remove(widget.topic.vocabularies[index]);
                                    });
                                  }
                                },
                                star: widget.topic.vocabularies[index].star,
                                term: widget.topic.vocabularies[index].term,
                                definition: widget.topic.vocabularies[index].definition,
                              )
                            : VocabularyWidget3(
                                term: widget.topic.vocabularies[index].term,
                                definition: widget.topic.vocabularies[index].definition,
                              );
                      },
                    )
                  : ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: starVocabulary.length,
                      itemBuilder: (context, index) {
                        return VocabularyWidget2(
                          onPress: () {
                            int i = widget.topic.vocabularies.indexWhere((item) => item == starVocabulary[index]);
                            widget.topic.vocabularies[i].star = !widget.topic.vocabularies[i].star;
                            TopicUseCase().editTopic(widget.topic.title, widget.topic.vocabularies, widget.topic.id.toString());
                            setState(() {
                              starVocabulary.remove(starVocabulary[index]);
                            });
                          },
                          star: true,
                          term: starVocabulary[index].term,
                          definition: starVocabulary[index].definition,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
