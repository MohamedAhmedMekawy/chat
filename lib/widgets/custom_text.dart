import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;
  final double? textHeight;
  final bool? underLine;
  final String? fontFamily;
  final TextAlign? align;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  const CustomText({
    super.key,
    this.title,
    this.color,
    this.size,
    this.fontFamily,
    this.letterSpacing,
    this.fontWeight,
    this.textHeight,
    this.maxLines,
    this.underLine = false,
    this.align,
    this.textOverflow,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines,
      overflow: textOverflow,
      textDirection: textDirection,
      //textScaleFactor: 0.7,
      style: TextStyle(
        decoration: underLine! ? TextDecoration.underline : TextDecoration.none,
        fontSize: size?.sp ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: textHeight,
        color: color ?? ColorManager.offWhiteColor,
      ),
    );
  }
}
