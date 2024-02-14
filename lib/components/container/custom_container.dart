import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final ImageProvider<Object>? image;
  final double? borderRadiusAll;
  final BorderRadiusGeometry? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final BoxFit? fit;
  const CustomContainer(
      {super.key,
      this.image,
      this.borderRadiusAll,
      this.borderWidth,
      this.borderColor,
      this.color,
      this.child,
      this.padding,
      this.width,
      this.height,
      this.boxShadow,
      this.borderRadius, this.fit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent),
          borderRadius: borderRadiusAll != null
              ? BorderRadius.circular(borderRadiusAll!)
              : borderRadius,
          image: image != null
              ? DecorationImage(image: image!, fit:fit ?? BoxFit.contain)
              : null,
          boxShadow: boxShadow),
      child: child,
    );
  }
}
