import 'package:auto_route/auto_route.dart';
import 'package:client/features/library/data/models/topic_list_model.dart';
import 'package:client/features/library/domain/providers/topic_list_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../create/data/models/folder_model.dart';
import '../../../create/data/models/topic_model.dart';
import '../../domain/providers/folder_list_provider.dart';
import '../../domain/usecases/folder_usecase.dart';
import '../widgets/topic_widget.dart';

@RoutePage()
class AddTopicsToFolderScreen extends StatefulWidget {
  final TopicListModel topicList;
  final String folderId;

  const AddTopicsToFolderScreen({super.key, required this.topicList, required this.folderId});

  @override
  State<AddTopicsToFolderScreen> createState() => _AddTopicToFolderScreenState();
}

class _AddTopicToFolderScreenState extends State<AddTopicsToFolderScreen> {
  List<String> list = [];

  @override
  void initState() {
    for (TopicModel topicModel in widget.topicList.topicList) {
      list.add(topicModel.id.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final topicList = ref.watch(topicListProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Add topics",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            centerTitle: true,
            actions: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return TextButton(
                    onPressed: () async {
                      FolderUseCase().editTopicsInFolder(list, widget.folderId).then((value) {
                        FolderModel folder = value;
                        ref.read(folderListProvider.notifier).refresh();
                        AutoRouter.of(context).maybePop().then((value) => AutoRouter.of(context).replace(FolderRoute(folder: folder)));
                      });
                    },
                    style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                    child: const Text(
                      "Done",
                      style: TextStyle(color: AppColors.black),
                    ),
                  );
                },
              ),
            ],
          ),
          body: topicList.when(
              data: (topicList) {
                return topicList.length <= 0
                    ? const Center(
                        child: Text("You have not create any topics yet"),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                if (list.any((element) => element == topicList.get(index).id.toString())) {
                                  setState(() {
                                    list.remove(topicList.get(index).id.toString());
                                  });
                                } else {
                                  setState(() {
                                    list.add(topicList.get(index).id.toString());
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: list.any((element) => element == topicList.get(index).id.toString()) ? AppColors.blue : AppColors.lightGrey,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(7))),
                                child: TopicWidget(
                                  topic: topicList.get(index),
                                  margin: 0,
                                ),
                              ),
                            ),
                            itemCount: topicList.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(
                                height: 7,
                              );
                            },
                          ),
                        ),
                      );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container()),
        );
      },
    );
  }
}
