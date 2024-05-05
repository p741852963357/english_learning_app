import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final IconData? prefixIcon;

  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.transparent,
          backgroundColor: AppColors.lightGrey,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Icon(
                prefixIcon,
                color: AppColors.black,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(color: AppColors.black),
              ),
            ],
          ),
        ));
  }
}
