import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
        contentPadding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        title: Row(
          children: [
            Expanded(
              child: Column(
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
            ),
            const SizedBox(width: 10),
            IconButton(
                onPressed: () async {
                  FlutterTts flutterTts = FlutterTts();
                  await flutterTts.speak(term);
                },
                icon: const Icon(Icons.volume_up_outlined))
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
