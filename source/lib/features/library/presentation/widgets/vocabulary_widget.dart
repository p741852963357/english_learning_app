import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../../constants/app_colors.dart';

class VocabularyWidget extends StatefulWidget {
  final String term;
  final String definition;
  final bool star;
  final Function onPress;
  const VocabularyWidget({super.key, required this.term, required this.definition, required this.star, required this.onPress});

  @override
  State<VocabularyWidget> createState() => _VocabularyWidgetState();
}

class _VocabularyWidgetState extends State<VocabularyWidget> {
  bool star = false;

  @override
  void initState() {
    setState(() {
      star = widget.star;
    });

    super.initState();
  }

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
                    widget.term,
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
                await flutterTts.speak(widget.term);
              },
              icon: const Icon(Icons.volume_up_outlined),
            ),
            IconButton(
              onPressed: () {
                widget.onPress();
                setState(() {
                  star = !star;
                });
              },
              icon: star ? const Icon(Icons.star_rounded) : const Icon(Icons.star_border_rounded),
            )
          ],
        ),
        subtitle: Text(
          widget.definition.isNotEmpty ? widget.definition : '...',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}
