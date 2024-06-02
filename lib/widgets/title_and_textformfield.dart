import 'package:flutter/material.dart';

class TitleAndTextFormField extends StatelessWidget {
  const TitleAndTextFormField({
    super.key,
    required this.title,
    required this.width,
    this.maxLines = 1,
    this.filled,
    this.filledColor,
    this.borderRadius = 0,
    this.textStyle,
    required this.fontColor,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  final String title;
  final double width;
  final int maxLines;
  final bool? filled;
  final Color? filledColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color fontColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(
          width: width,
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            maxLines: maxLines,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: filled,
              fillColor: filledColor,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
