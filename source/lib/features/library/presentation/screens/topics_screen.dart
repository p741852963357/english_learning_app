import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/features/library/domain/providers/topic_list_provider.dart';
import 'package:client/features/library/presentation/widgets/topic_widget.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Consumer(
        builder: (context, ref, child) {
          final topicList = ref.watch(topicListProvider);
          return topicList.when(
              data: (topicList) {
                return topicList.length <= 0
                    ? const Center(
                        child: Text("You have not create any topics yet"),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
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
                          ),
                        ),
                      );
              },
              loading: () => Container(),
              error: (Object error, StackTrace stackTrace) => Container());
        },
      ),
    );
  }
}
