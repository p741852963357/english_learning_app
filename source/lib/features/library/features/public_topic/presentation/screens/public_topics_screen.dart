import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../routes/app_router.gr.dart';
import '../../../../presentation/widgets/topic_widget.dart';
import '../../domain/providers/public_topics_provider.dart';

@RoutePage()
class PublicTopicsScreen extends ConsumerStatefulWidget {
  const PublicTopicsScreen({super.key});

  @override
  ConsumerState<PublicTopicsScreen> createState() => _PublicTopicsScreenState();
}

class _PublicTopicsScreenState extends ConsumerState<PublicTopicsScreen> {
  @override
  Widget build(BuildContext context) {
    final topics = ref.watch(publicTopicsProvider);
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
                      AutoRouter.of(context).push(PublicTopicRoute(topic: topicList.get(index).topic));
                    },
                    child: TopicWidget(
                      topic: topicList.get(index).topic,
                    ),
                  ),
                  itemCount: topicList.length,
                );
              },
              loading: () => Container(),
              error: (Object error, StackTrace stackTrace) => Container()),
        ));
  }
}
