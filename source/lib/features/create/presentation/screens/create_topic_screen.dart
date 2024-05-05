import 'package:auto_route/annotations.dart';
import 'package:client/features/create/presentation/widgets/vocabulary_textfield_widget.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../widgets/vocabulary_controller.dart';

@RoutePage()
class CreateTopicScreen extends StatefulWidget {
  const CreateTopicScreen({super.key});

  @override
  State<CreateTopicScreen> createState() => _CreateTopicScreenState();
}

class _CreateTopicScreenState extends State<CreateTopicScreen> {
  TextEditingController titleController = TextEditingController();
  List<VocabularyController> vocabularyControllers = <VocabularyController>[];

  @override
  void initState() {
    super.initState();
    vocabularyControllers.add(
      VocabularyController(TextEditingController(), TextEditingController()),
    );
    vocabularyControllers.add(
      VocabularyController(TextEditingController(), TextEditingController()),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    for (final vocabularyController in vocabularyControllers) {
      vocabularyController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        title: const Text(
          "Create topic",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
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
                        borderSide:
                            BorderSide(color: AppColors.black, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.black, width: 4),
                      ),
                    ),
                    autofocus: true,
                  ),
                ),
                ListView.separated(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: vocabularyControllers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VocabularyTextFieldWidget(
                        vocabularyController: vocabularyControllers[0]);
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
                    vocabularyControllers.add(
                      VocabularyController(
                          TextEditingController(), TextEditingController()),
                    );
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
              )),
        ),
      ),
    );
  }
}
