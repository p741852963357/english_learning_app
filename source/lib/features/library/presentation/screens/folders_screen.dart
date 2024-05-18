import 'package:auto_route/auto_route.dart';
import 'package:client/features/library/domain/providers/folder_list_provider.dart';
import 'package:client/features/library/presentation/widgets/folder_widget.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';

@RoutePage()
class FoldersScreen extends StatefulWidget {
  const FoldersScreen({super.key});

  @override
  State<FoldersScreen> createState() => _FoldersScreenState();
}

class _FoldersScreenState extends State<FoldersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Consumer(
        builder: (context, ref, child) {
          final folderList = ref.watch(folderListProvider);
          return folderList.when(
              data: (folderList) {
                return folderList.length <= 0
                    ? const Center(
                        child: Text("You have not create any folders yet"),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(FolderRoute(folder: folderList.get(index)));
                              },
                              child: FolderWidget(
                                folder: folderList.get(index),
                              ),
                            ),
                            itemCount: folderList.length,
                          ),
                        ),
                      );
              },
              loading: () => Container(),
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              });
        },
      ),
    );
  }
}
