import 'package:flutter/material.dart';

class VocabularyController {
  final TextEditingController termController;
  final TextEditingController definitionController;

  VocabularyController(this.termController, this.definitionController);

  void dispose() {
    termController.dispose();
    definitionController.dispose();
  }
}
