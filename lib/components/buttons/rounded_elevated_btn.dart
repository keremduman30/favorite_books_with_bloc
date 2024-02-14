import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedElevatedButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final String btnText;
  final double? radiusAll;
  const RoundedElevatedButtonWidget(
      {super.key,
      this.width,
      this.height,
      required this.backgroundColor,
      this.textStyle,
      required this.onPressed,
      required this.btnText,
      this.radiusAll});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 220.w,
      height: height ?? 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusAll ?? 10)),
        ),
        child: Text(
          btnText,
          style: textStyle,
        ),
      ),
    );
  }
}
