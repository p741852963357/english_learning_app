// ignore_for_file: prefer_const_constructors
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/features/home/domain/providers/public_topics_provider.dart';
import 'package:client/features/home/domain/providers/user_public_topic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_router.gr.dart';
import '../../../library/presentation/widgets/topic_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(publicTopicsProvider);
    final userPublicTopic = ref.watch(userPublicTopicsProvider);
    userPublicTopic.when(
        data: (data) {
          return print(data);
        },
        loading: () => Container(),
        error: (Object error, StackTrace stackTrace) => Container());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wordify",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Public topics",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              data.when(
                  data: (data) {
                    return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(TopicRoute(topic: data.get(index)));
                        },
                        child: TopicWidget(
                          topic: data.get(index),
                        ),
                      ),
                      itemCount: data.length,
                    );
                  },
                  loading: () => Container(),
                  error: (Object error, StackTrace stackTrace) => Container())
            ],
          ),
        ),
      ),
    );
  }
}
