import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../create/data/models/topic_model.dart';

class TopicWidget extends StatefulWidget {
  final TopicModel topic;
  final double margin;
  const TopicWidget({super.key, required this.topic, this.margin = 4.0});

  @override
  State<TopicWidget> createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(widget.margin),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: widget.margin == 0 ? Colors.transparent : AppColors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        title: Text(
          widget.topic.title,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.topic.length} terms",
              style: const TextStyle(
                color: AppColors.strongGrey,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.topic.owner,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
