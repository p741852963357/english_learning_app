import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../create/data/models/topic_model.dart';

class TopicWidget extends StatelessWidget {
  final TopicModel topic;
  const TopicWidget({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(7),
      ),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: ListTile(
        title: Text(
          topic.title,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          "${topic.length} terms",
          style: const TextStyle(
            color: AppColors.strongGrey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
