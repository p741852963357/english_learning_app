import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String helperText;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final Function onChange;
  final FocusNode? focusNode;
  final bool readOnly;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.helperText,
    this.hintText = "",
    this.obscureText = false,
    this.errorText,
    required this.onChange,
    this.focusNode,
    this.readOnly = false,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  String? errorText;

  @override
  void initState() {
    errorText = widget.errorText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                widget.onChange();
              });
            },
            readOnly: widget.readOnly,
            focusNode: widget.focusNode,
            controller: widget.controller,
            cursorColor: AppColors.black,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              errorText: widget.errorText,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: AppColors.grey),
              helperText: widget.helperText,
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade900, width: 2),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade900, width: 4),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 2),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
