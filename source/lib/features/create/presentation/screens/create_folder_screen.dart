import 'package:auto_route/annotations.dart';
import 'package:client/features/create/data/models/folder_model.dart';
import 'package:client/features/create/domain/usecases/folder_creation_usecase.dart';
import 'package:client/features/library/domain/providers/folder_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';

@RoutePage()
class CreateFolderScreen extends StatefulWidget {
  const CreateFolderScreen({super.key});

  @override
  State<CreateFolderScreen> createState() => _CreateFolderScreenState();
}

class _CreateFolderScreenState extends State<CreateFolderScreen> {
  TextEditingController titleController = TextEditingController();
  bool textButtonVisibility = false;

  @override
  void initState() {
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
          "Create folder",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return textButtonVisibility
                  ? TextButton(
                      onPressed: () async {
                        FolderModel folder = await FolderCreationUseCase().createFolder(titleController.text);
                        ref.read(folderListProvider.notifier).refresh();
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
          autofocus: true,
        ),
      ),
    );
  }
}
