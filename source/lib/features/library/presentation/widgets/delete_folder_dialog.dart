import 'package:auto_route/auto_route.dart';
import 'package:client/features/library/domain/providers/folder_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_colors.dart';
import '../../domain/usecases/folder_usecase.dart';

class DeleteFolderDialog extends StatelessWidget {
  final String id;
  const DeleteFolderDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: const Padding(
        padding: EdgeInsets.only(top: 20, left: 5, right: 5),
        child: Text("Are you sure you want to delete this folder?"),
      ),
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      actions: [
        TextButton(
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: AppColors.blue),
          ),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return TextButton(
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              onPressed: () {
                FolderUseCase folderUseCase = FolderUseCase();
                folderUseCase
                    .deleteFolder(id)
                    .then((value) => AutoRouter.of(context).maybePop())
                    .then((value) => AutoRouter.of(context).maybePop())
                    .then((value) => ref.read(folderListProvider.notifier).refresh());
              },
              child: Text(
                "Delete",
                style: TextStyle(color: AppColors.red),
              ),
            );
          },
        ),
      ],
    );
  }
}
