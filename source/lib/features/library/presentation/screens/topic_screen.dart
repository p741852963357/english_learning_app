import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/library/presentation/widgets/option_widget.dart';
import 'package:client/features/library/presentation/widgets/vocabulary_widget.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

@RoutePage()
class TopicScreen extends StatefulWidget {
  final TopicModel topic;

  const TopicScreen({super.key, required this.topic});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
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
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          OptionWidget(
                            icon: const Icon(Icons.edit),
                            title: 'Edit topic',
                            onTap: () {
                              AutoRouter.of(context).push(const CreateTopicRoute());
                            },
                          ),
                          OptionWidget(
                            icon: const Icon(Icons.folder_outlined),
                            title: 'Add to folder',
                            onTap: () {
                              AutoRouter.of(context).push(const CreateTopicRoute());
                            },
                          ),
                          OptionWidget(
                            icon: const Icon(Icons.delete),
                            title: 'Delete topic',
                            onTap: () {
                              AutoRouter.of(context).push(const CreateTopicRoute());
                            },
                          )
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
              // TODO LEARN
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
      ),
    );
  }
}
