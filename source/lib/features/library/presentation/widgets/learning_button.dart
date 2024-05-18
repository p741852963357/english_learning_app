import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class LearningButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final IconData prefixIcon;

  const LearningButton({super.key, required this.onPressed, required this.title, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 1,
          color: Colors.grey.withOpacity(0.1),
          offset: const Offset(0, 0),
        )
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.transparent,
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
        ),
        onPressed: () {
          onPressed();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Icon(
                prefixIcon,
                color: AppColors.blue,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
