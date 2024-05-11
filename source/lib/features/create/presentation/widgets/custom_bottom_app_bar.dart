import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Future Function() onPressed;
  final bool? Function() validate;
  const CustomBottomAppBar({super.key, required this.onPressed, required this.validate});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: BottomAppBar(
          height: 75,
          surfaceTintColor: AppColors.white,
          color: AppColors.white,
          child: ElevatedButton(
            onPressed: () async {
              if (widget.validate() == true) {
                setState(() {
                  loading = true;
                });
                Future.delayed(const Duration(seconds: 1), () async {
                  await widget.onPressed();
                  setState(() {
                    loading = false;
                  });
                });
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
              splashFactory: NoSplash.splashFactory,
              shadowColor: Colors.transparent,
              backgroundColor: AppColors.blue,
            ),
            child: loading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Text(
                    "Next",
                    style: TextStyle(color: AppColors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
