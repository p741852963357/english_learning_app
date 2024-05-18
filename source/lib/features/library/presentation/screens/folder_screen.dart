import 'package:auto_route/auto_route.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/features/create/data/models/folder_model.dart';
import 'package:client/features/library/presentation/widgets/delete_folder_dialog.dart';
import 'package:client/features/library/presentation/widgets/topic_widget.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../widgets/option_widget.dart';

@RoutePage()
class FolderScreen extends StatefulWidget {
  final FolderModel folder;

  const FolderScreen({super.key, required this.folder});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        actions: [
          IconButton(
              onPressed: () {
                final router = AutoRouter.of(context);
                router.push(AddTopicsToFolderRoute(
                  topicList: widget.folder.topicList,
                  folderId: widget.folder.id.toString(),
                ));
              },
              icon: const Icon(Icons.add)),
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
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          OptionWidget(
                            icon: const Icon(Icons.edit),
                            title: 'Edit folder',
                            onTap: () {
                              AutoRouter.of(context).push(EditFolderRoute(folder: widget.folder));
                            },
                          ),
                          OptionWidget(
                            icon: const Icon(Icons.delete),
                            title: 'Delete folder',
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => DeleteFolderDialog(
                                  id: widget.folder.id.toString(),
                                ),
                              );
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.folder.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  '${widget.folder.topicList.length.toString()} topics',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.strongGrey,
                  ),
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
                  widget.folder.owner,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 30),
            widget.folder.topicList.length == 0
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Text(
                          "This folder has no topics",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              final router = AutoRouter.of(context);
                              router.push(AddTopicsToFolderRoute(
                                topicList: widget.folder.topicList,
                                folderId: widget.folder.id.toString(),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                              splashFactory: NoSplash.splashFactory,
                              shadowColor: Colors.transparent,
                              backgroundColor: AppColors.blue,
                            ),
                            child: const Text(
                              "Add a topic",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.folder.topicList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(TopicRoute(topic: widget.folder.topicList.get(index)));
                        },
                        child: TopicWidget(
                          topic: widget.folder.topicList.get(index),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
