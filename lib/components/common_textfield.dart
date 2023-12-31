import 'package:attendance_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CommonFieldComponent extends StatelessWidget {
  const CommonFieldComponent({
    super.key,
    this.prefixIcon,
    this.controller,
    this.hintText,
    this.maxLines,
    this.minLines,
    this.keyboardType, this.maxLength,
  });
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomeColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xffDAE1E1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines??1,
          maxLength: maxLength,
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xffDAE1E1))),
        ),
      ),
    );
  }
}