import 'package:auto_route/auto_route.dart';
import 'package:client/features/create/data/models/topic_model.dart';
import 'package:client/features/create/data/models/vocabulary_model.dart';
import 'package:client/features/library/domain/usecases/topic_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../constants/app_colors.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../create/presentation/widgets/vocabulary_textfield_widget.dart';
import '../../../create/utils/topic_creation_validator.dart';
import '../../domain/providers/topic_list_provider.dart';

@RoutePage()
class EditTopicScreen extends StatefulWidget {
  final TopicModel topicModel;
  const EditTopicScreen({super.key, required this.topicModel});

  @override
  State<EditTopicScreen> createState() => _EditTopicScreenState();
}

class _EditTopicScreenState extends State<EditTopicScreen> {
  TextEditingController titleController = TextEditingController();
  List<TextEditingController> termControllers = [];
  List<TextEditingController> definitionControllers = [];
  List<bool> stars = [];

  @override
  void initState() {
    titleController.text = widget.topicModel.title;
    for (VocabularyModel vocabulary in widget.topicModel.vocabularies) {
      termControllers.add(TextEditingController(text: vocabulary.term));
      definitionControllers.add(TextEditingController(text: vocabulary.definition));
      stars.add(vocabulary.star);
    }
    super.initState();
  }

  @override
  void dispose() {
    for (final i in termControllers) {
      i.dispose();
    }
    for (final i in definitionControllers) {
      i.dispose();
    }
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        title: const Text(
          "Edit topic",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: TextButton(
                  style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () async {
                    final result = TopicCreationValidator().validate(termControllers, titleController);
                    if (result != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          content: Text(
                            result,
                          ),
                          title: const Text(
                            "Notice",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(color: AppColors.blue),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      List<VocabularyModel> vocabularies = [];
                      for (var i = 0; i < termControllers.length; i++) {
                        if (termControllers[i].text.isNotEmpty) {
                          vocabularies.add(VocabularyModel(
                            term: termControllers[i].text,
                            definition: definitionControllers[i].text,
                            star: stars[i],
                          ));
                        }
                      }
                      TopicUseCase().editTopic(titleController.text, vocabularies, widget.topicModel.id.toString()).then((value) {
                        TopicModel topic = value;
                        ref.read(topicListProvider.notifier).refresh();
                        context.router.maybePop().then((_) => context.router.replace(TopicRoute(topic: topic)));
                      });
                    }
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        color: AppColors.lightGrey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: titleController,
                    cursorColor: AppColors.black,
                    decoration: const InputDecoration(
                      hintText: "Subject, chapter, unit",
                      helperText: "Title",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black, width: 4),
                      ),
                    ),
                  ),
                ),
                ListView.separated(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: termControllers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          CustomSlidableAction(
                            backgroundColor: Colors.transparent,
                            onPressed: (BuildContext context) {},
                            child: SizedBox(
                              height: 75,
                              child: Builder(
                                builder: (BuildContext context) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        backgroundColor: Colors.red.shade900,
                                        foregroundColor: AppColors.black,
                                      ),
                                      onPressed: () async {
                                        await Slidable.of(context)?.close();
                                        setState(() {
                                          termControllers[index].dispose();
                                          definitionControllers[index].dispose();
                                          termControllers.removeAt(index);
                                          definitionControllers.removeAt(index);
                                          stars.removeAt(index);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.delete_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      child: VocabularyTextFieldWidget(
                        termController: termControllers[index],
                        definitionController: definitionControllers[index],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 7);
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 0.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: BottomAppBar(
            height: 60,
            surfaceTintColor: AppColors.white,
            color: AppColors.white,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  termControllers.add(TextEditingController());
                  definitionControllers.add(TextEditingController());
                  stars.add(false);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.black,
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
