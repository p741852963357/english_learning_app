import 'package:auto_route/auto_route.dart';
import 'package:client/features/home/domain/providers/global_public_topics_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_router.gr.dart';
import '../../../library/presentation/widgets/topic_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(globalPublicTopicsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wordify",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Public topics",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              data.when(
                data: (data) {
                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(PublicTopicRoute(topic: data.get(index)));
                      },
                      child: TopicWidget(
                        topic: data.get(index),
                      ),
                    ),
                    itemCount: data.length,
                  );
                },
                loading: () => Container(),
                error: (Object error, StackTrace stackTrace) => Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
