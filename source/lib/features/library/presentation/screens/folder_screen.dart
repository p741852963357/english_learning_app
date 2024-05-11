import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
