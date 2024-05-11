import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class OptionWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function? onTap;
  const OptionWidget({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: AppColors.lightGrey,
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        onTap: () {
          Navigator.of(context).pop();
          onTap!();
        },
      ),
    );
  }
}
