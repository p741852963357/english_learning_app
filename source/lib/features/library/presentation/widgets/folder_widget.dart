import 'package:client/features/create/data/models/folder_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class FolderWidget extends StatelessWidget {
  final FolderModel folder;
  const FolderWidget({super.key, required this.folder});

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
        contentPadding: const EdgeInsets.only(top: 5, left: 15, bottom: 5),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Row(
            children: [
              const Icon(
                Icons.folder_outlined,
                color: AppColors.strongGrey,
              ),
              const SizedBox(width: 15),
              Text(
                folder.title,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 100),
            ],
          ),
        ),
        subtitle: Text(
          "${folder.topicList.length} topics",
          style: const TextStyle(
            color: AppColors.strongGrey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
