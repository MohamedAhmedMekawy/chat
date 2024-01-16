import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool textWithImage, isDark;
  final bool loading;
  final Widget? image;
  final Color? btnColor, borderColor;
  final double? btnTextSize;
  final Color? btnTextColor;
  final Color? loadingColor;
  final Gradient? gradient;
  final FontWeight? btnTextFontWeight;
  final double? btnWidth,
      borderWidth,
      borderRadius,
      btnHeight,
      spaceBetween,
      marginVertical,
      marginHorizontal;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.btnColor,
    this.loading = false,
    this.textWithImage = false,
    this.btnHeight,
    this.btnTextSize,
    this.btnTextColor,
    this.image,
    this.gradient,
    this.btnTextFontWeight,
    this.borderColor,
    this.borderWidth,
    this.btnWidth,
    this.spaceBetween,
    this.marginVertical,
    this.marginHorizontal,
    this.borderRadius,
    this.isDark = true,
    this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: loading ? null : onTap,
        child: Container(
          height: btnHeight ?? 64.h,
          width: btnWidth ?? double.infinity,
          margin: EdgeInsets.symmetric(
              vertical: marginVertical ?? 14.h,
              horizontal: marginHorizontal ?? 0),
          decoration: BoxDecoration(
              color: btnColor ?? ColorManager.yellowColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 20)),
              border: Border.all(
                  width: borderWidth == null ? 1 : borderWidth!,
                  color:
                      borderColor == null ? Colors.transparent : borderColor!)),
          child: Center(
            child: loading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        color: loadingColor ?? ColorManager.scaffoldBGColor,
                        strokeWidth: 2),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (image != null) ...[
                        image!,
                        10.horizontalSpace,
                      ],
                      CustomText(
                        title: text,
                        color: btnTextColor ?? ColorManager.scaffoldBGColor,
                        size: btnTextSize ?? 16,
                        fontWeight: btnTextFontWeight ?? FontWeight.bold,
                      ),
                    ],
                  ),
          ),
        ));
  }
}
