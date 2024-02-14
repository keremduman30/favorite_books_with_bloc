import 'package:favorite_books/core/extension/context_extension.dart';
import 'package:favorite_books/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool? hideText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? isEmail;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.hideText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.border,
      this.onChanged,
      this.focusNode,
      this.hintStyle,
      this.isEmail});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: context.paddingLow,
      onChanged: onChanged,
      focusNode: focusNode,
      obscureText: hideText ?? false,
      controller: controller,
      autofocus: false,
      cursorColor: context.colors.secondary,
      maxLines: 1,
      decoration: InputDecoration(
          hintText: hintText,
          counterText: "",
          border: border ?? InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: hintStyle,
          isDense: true),
      validator: validator ?? (value) => value?.validator,
    );
  }
}
