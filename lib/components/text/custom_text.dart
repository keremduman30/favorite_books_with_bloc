import 'package:favorite_books/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final TextStyle? style;
  final double? paddingVertical;
  final double? paddingHorizantol;
  final String text;
  const CustomText({super.key, this.style, required this.text, this.paddingVertical, this.paddingHorizantol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizantol ?? 0, vertical: paddingVertical ?? 0),
      child: Text(
        text,
        style: style ?? context.textThem.titleSmall,
      ),
    );
  }
}
