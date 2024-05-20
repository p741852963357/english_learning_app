import 'package:auto_route/auto_route.dart';
import 'package:client/features/create/presentation/widgets/custom_button.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                  prefixIcon: Icons.library_books_outlined,
                  title: 'Topic',
                  onPressed: () {
                    AutoRouter.of(context).push(const CreateTopicRoute());
                  },
                )),
            const SizedBox(height: 10),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                  prefixIcon: Icons.folder_outlined,
                  title: 'Folder',
                  onPressed: () {
                    AutoRouter.of(context).push(const CreateFolderRoute());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
