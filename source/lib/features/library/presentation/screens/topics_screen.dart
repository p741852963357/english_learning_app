import 'package:auto_route/auto_route.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/features/library/domain/providers/topic_list_provider.dart';
import 'package:client/features/library/features/public_topic/domain/providers/public_topics_provider.dart';
import 'package:client/features/library/presentation/widgets/topic_widget.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class TopicsScreen extends ConsumerStatefulWidget {
  const TopicsScreen({super.key});

  @override
  ConsumerState<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends ConsumerState<TopicsScreen> {
  @override
  Widget build(BuildContext context) {
    final topics = ref.watch(topicListProvider);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        child: topics.when(
            data: (topicList) {
              return ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(TopicRoute(topic: topicList.get(index)));
                  },
                  child: TopicWidget(
                    topic: topicList.get(index),
                  ),
                ),
                itemCount: topicList.length,
              );
            },
            loading: () => Container(),
            error: (Object error, StackTrace stackTrace) => Container()),
      ),
    );
  }
}
