import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class VocabularyWidget extends StatelessWidget {
  final String term;
  final String definition;
  const VocabularyWidget({super.key, required this.term, required this.definition});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              maxLines: 4,
              term,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
        subtitle: Text(
          definition.isNotEmpty ? definition : '...',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}
