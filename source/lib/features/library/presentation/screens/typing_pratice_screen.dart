import 'package:auto_route/auto_route.dart';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../domain/providers/flashcards_provider.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_linear_progress_indicator.dart';

@RoutePage()
class TypingScreen extends ConsumerStatefulWidget {
  final TopicModel topic;
  const TypingScreen({super.key, required this.topic});

  @override
  ConsumerState<TypingScreen> createState() => _TypingPracticeScreenState();
}

class _TypingPracticeScreenState extends ConsumerState<TypingScreen> {
  late int lastIndex;

  @override
  void initState() {
    lastIndex = ref.read(flashcardsProvider.notifier).length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(flashcardsProvider);

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        centerTitle: true,
        title: Text(
          '${data.index == lastIndex ? lastIndex : data.index + 1} / $lastIndex',
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.black),
        ),
        bottom: CustomLinearProgressIndicator(
          value: data.index / lastIndex,
        ),
        leading: const CustomBackButton(
          icon: Icons.close_rounded,
        ),
        actions: [
          data.index == lastIndex
              ? const SizedBox()
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_rounded,
                    color: AppColors.black,
                  ),
                )
        ],
      ),
      body: const AutoRouter(),
    );
  }
}
