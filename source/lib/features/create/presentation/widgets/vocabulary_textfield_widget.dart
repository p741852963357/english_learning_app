import 'package:client/features/create/presentation/widgets/vocabulary_controller.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class VocabularyTextFieldWidget extends StatefulWidget {
  final VocabularyController vocabularyController;

  const VocabularyTextFieldWidget({
    super.key,
    required this.vocabularyController,
  });

  @override
  State<VocabularyTextFieldWidget> createState() =>
      _VocabularyTextFieldWidgetState();
}

class _VocabularyTextFieldWidgetState extends State<VocabularyTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius: 0,
          blurRadius: 10,
          offset: const Offset(0, 0),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: widget.vocabularyController.termController,
              cursorColor: AppColors.black,
              decoration: const InputDecoration(
                helperText: "Term",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 4),
                ),
              ),
            ),
            TextField(
              controller: widget.vocabularyController.definitionController,
              cursorColor: AppColors.black,
              decoration: const InputDecoration(
                helperText: "Definition",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
