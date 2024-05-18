import 'package:flutter/material.dart';

class TrueWidget extends StatelessWidget {
  final int trueNum;
  const TrueWidget({super.key, required this.trueNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 5, right: 15, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        border: Border(
          left: BorderSide(
            color: Colors.green.shade400,
          ),
          top: BorderSide(
            color: Colors.green.shade400,
          ),
          bottom: BorderSide(
            color: Colors.green.shade400,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Text(
        trueNum.toString(),
        style: TextStyle(
          color: Colors.green.shade900,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}
