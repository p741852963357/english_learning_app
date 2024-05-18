import 'package:flutter/material.dart';

class FalseWidget extends StatelessWidget {
  final int falseNum;
  const FalseWidget({super.key, required this.falseNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 5, right: 20, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        border: Border(
          right: BorderSide(
            color: Colors.orange.shade400,
          ),
          top: BorderSide(
            color: Colors.orange.shade400,
          ),
          bottom: BorderSide(
            color: Colors.orange.shade400,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Text(
        falseNum.toString(),
        style: TextStyle(
          color: Colors.orange.shade900,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}
