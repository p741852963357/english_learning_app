import 'package:client/constants/app_colors.dart';
import 'package:flutter/material.dart';

const double customAppBarProgressIndicatorHeight = 4.0;

class CustomLinearProgressIndicator extends SizedBox implements PreferredSizeWidget {
  final double value;

  CustomLinearProgressIndicator({required this.value, super.key})
      : super(
          child: LinearProgressIndicator(
            color: AppColors.strongGrey,
            value: value,
          ),
        );

  @override
  Size get preferredSize => const Size(
        double.infinity,
        customAppBarProgressIndicatorHeight,
      );
}
