import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/resource/strings_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    unselectedWidgetColor: ColorManager.mainText,
    primaryColor: ColorManager.primaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(
        secondary:
            ColorManager.scaffoldBGColor), // colorScheme: const ColorScheme(
    //   brightness: Brightness.light,
    //   primary: ColorManager.whightColor,
    //   onPrimary: ColorManager.whightColor,
    //   secondary: ColorManager.whightColor,
    //   onSecondary: ColorManager.whightColor,
    //   error: ColorManager.redColor,
    //   onError: ColorManager.redColor,
    //   background: ColorManager.whightColor,
    //   onBackground: ColorManager.whightColor,
    //   surface: ColorManager.whightColor,
    //   onSurface: ColorManager.whightColor,
    // ),
    hintColor: ColorManager.hintColor,
    secondaryHeaderColor: ColorManager.primaryExtraDark,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: ColorManager.scaffoldBGColor,
    fontFamily: AppStrings.fontFamily,
    sliderTheme: SliderThemeData(
      activeTrackColor: ColorManager.yellowColor,
      inactiveTrackColor: ColorManager.lightGrayColor,
      thumbColor: ColorManager.offWhiteColor,
      trackHeight: 5,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.radius),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.radius),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        color: ColorManager.darkGrayColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      visualDensity: VisualDensity.standard,
      selectedTileColor: ColorManager.lightWhiteColor,
      tileColor: ColorManager.lightWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      dense: true,
      horizontalTitleGap: 0,
      minLeadingWidth: 25.w,
      contentPadding: 20.hPadding,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorManager.accentColor,
      refreshBackgroundColor: ColorManager.whiteColor,
    ),
    // app Bar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorManager.whiteColor,
        fontSize: 20.sp,
      ),
    ),
    // icon Theme
    iconTheme: IconThemeData(
      size: 26.radius,
      color: ColorManager.blackColor,
    ),

    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    // divider Theme
    dividerTheme: const DividerThemeData(
      thickness: 2,
      indent: 0,
      endIndent: 0,
      color: ColorManager.dividerColor,
      space: 1,
    ),
    cardTheme: CardTheme(
      color: ColorManager.dividerColor,
      shadowColor: ColorManager.blackColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.radius),
      ),
      elevation: 6,
    ),
  );
}
