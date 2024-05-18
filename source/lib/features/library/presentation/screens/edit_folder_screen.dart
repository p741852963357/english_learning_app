import 'package:auto_route/auto_route.dart';
import 'package:client/features/create/data/models/folder_model.dart';
import 'package:client/features/library/domain/providers/folder_list_provider.dart';
import 'package:client/features/library/domain/usecases/folder_usecase.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';

@RoutePage()
class EditFolderScreen extends StatefulWidget {
  final FolderModel folder;
  const EditFolderScreen({super.key, required this.folder});

  @override
  State<EditFolderScreen> createState() => _EditFolderScreenState();
}

class _EditFolderScreenState extends State<EditFolderScreen> {
  late TextEditingController titleController;
  bool textButtonVisibility = true;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.folder.title);
    titleController.addListener(() {
      setState(() {
        if (titleController.text.isEmpty) {
          textButtonVisibility = false;
        } else {
          textButtonVisibility = true;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit folder",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return textButtonVisibility
                  ? TextButton(
                      onPressed: () async {
                        if (titleController.text == widget.folder.title) {
                          AutoRouter.of(context).maybePop();
                        } else {
                          FolderUseCase().editFolder(widget.folder.id.toString(), titleController.text).then((value) {
                            FolderModel folder = value;
                            ref.read(folderListProvider.notifier).refresh();
                            AutoRouter.of(context).maybePop().then((value) => AutoRouter.of(context).replace(FolderRoute(folder: folder)));
                          });
                        }
                      },
                      style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: AppColors.black),
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          controller: titleController,
          cursorColor: AppColors.black,
          decoration: const InputDecoration(
            helperText: "Folder title",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black, width: 4),
            ),
          ),
        ),
      ),
    );
  }
}
