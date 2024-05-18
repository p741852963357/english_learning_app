import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final IconData icon;

  const CustomBackButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
