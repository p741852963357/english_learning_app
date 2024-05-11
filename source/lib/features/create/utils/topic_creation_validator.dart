import 'package:flutter/material.dart';

class TopicCreationValidator {
  String? validate(List<TextEditingController> termControllers, TextEditingController title) {
    if (termControllers.length < 2) {
      return "Please add at least 2 terms to save your topic";
    }
    int count = 0;
    for (TextEditingController i in termControllers) {
      if (i.text.isNotEmpty) {
        count += 1;
      }
    }
    if (count < 2) {
      return "Please add at least 2 terms to save your topic";
    }
    if (title.text.isEmpty) {
      return "Please enter a title to save your topic";
    }

    return null;
  }
}
