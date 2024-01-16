import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/resource/app_keys.dart';
import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/utils/app_utils/navigators.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIGlobal {
  static Future<void> showBottomSheet(context,
      {Color? backgroundColor, Widget? child, double? height}) async {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: backgroundColor ?? ColorManager.scaffoldBGColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[20.verticalSpace, if (child != null) child],
            ),
          ),
        );
      },
    );
  }

  static Future<void> showAPIBottomSheet(
      {bool success = false,
      String? message = '',
      String? title,
      String? buttonText,
      bool? isDismissible,
      void Function()? onTap,
      Color? backgroundColor,
      Widget? child,
      double? height}) async {
    showModalBottomSheet(
      context: AppKeys.navigatorKey.currentContext!,
      useSafeArea: true,
      isDismissible: isDismissible ?? false,
      barrierColor: ColorManager.lightGrayColor.withOpacity(0.4),
      backgroundColor: backgroundColor ?? ColorManager.scaffoldBGColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: success
                      ? ColorManager.yellowColor
                      : ColorManager.redColor,
                  radius: 40,
                  child: Icon(
                    success ? Icons.check : Icons.clear_rounded,
                    color: ColorManager.whiteColor,
                    size: 30,
                  ),
                ).verticalPadding(20),
                CustomText(
                  title: title ??
                      (success ? S.of(context)!.success : S.of(context)!.ops),
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
                10.verticalSpace,
                CustomText(
                  title: message,
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.offWhiteColor.withOpacity(0.5),
                  align: TextAlign.center,
                ),
                10.verticalSpace,
                child ??
                    CustomButton(
                      onTap: onTap ?? () => popRoute(),
                      text: buttonText ?? S.of(context)!.ok,
                    ),
                20.verticalSpace,
              ],
            ).horizontalPadding(40),
          ),
        );
      },
    );
  }

  // static void showErrorDialog({required BuildContext context, required String msg}) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => CupertinoAlertDialog(
  //       title: Text(
  //         msg,
  //         style: const TextStyle(color: Colors.black, fontSize: 16),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           style: TextButton.styleFrom(
  //             foregroundColor: Colors.black,
  //             textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           child: Text(S.of(context)!.ok),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // static void showLoginDialog() {
  //   showDialog(
  //     barrierDismissible: true,
  //     context: AppKeys.navigatorKey.currentContext!,
  //     builder: (context) {
  //       return AlertDialog(
  //         actionsAlignment: MainAxisAlignment.center,
  //         alignment: Alignment.center,
  //         titlePadding: 10.vPadding + 10.hPadding,
  //         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  //         title: Column(
  //           children: [
  //             SvgPicture.asset(
  //               IconsPaths.danger,
  //               height: 70.w,
  //               width: 70.w,
  //             ),
  //             Text(
  //               S.of(context)!.loginFirst,
  //               style: context.bodyLargeB1.copyWith(color: AppColors.lightblackColor),
  //               textAlign: TextAlign.center,
  //             ),
  //             15.verticalSpace,
  //             ClickButton(
  //               onPressed: () => pushNamedRoute(Routes.loginView),
  //               text: S.of(context)!.login2,
  //               fontSize: 11,
  //               // width: 200.w,
  //               //height: 36,
  //               btnColor: AppColors.yellowColor,
  //               textColor: AppColors.blackColor,
  //             ),
  //             10.verticalSpace,
  //             Text.rich(
  //               TextSpan(
  //                 text: S.of(context)!.dontHaveAccount,
  //                 style: context.displaySmallH3,
  //                 children: [
  //                   TextSpan(
  //                     recognizer: TapGestureRecognizer()..onTap = () => pushNamedRoute(Routes.customerSingUpView),
  //                     text: S.of(context)!.registerNow,
  //                     style: context.displaySmallH3.copyWith(
  //                       color: AppColors.darkGreenColor,
  //                       decoration: TextDecoration.underline,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ).hPadding(20).vPadding(10),
  //         actionsPadding: const EdgeInsets.only(bottom: 25),
  //       );
  //     },
  //   );
  // }

  // static Future<void> showSuccessfulDialog({required BuildContext context, required String msg, void Function()? doneFun}) async {
  //   showDialog(
  //     barrierDismissible: true,
  //     context: context,
  //     builder: (context) {
  //       Future.delayed(
  //         const Duration(seconds: 1),
  //         doneFun ?? () => popRoute(),
  //       );
  //       return AlertDialog(
  //         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  //         title: Column(
  //           children: [
  //             SvgPicture.asset(
  //               IconsPaths.doneIcon,
  //               height: 155.w,
  //               width: 155.w,
  //             ),
  //             Text(
  //               msg,
  //               style: context.displayMediumH2.copyWith(color: AppColors.lightblackColor),
  //               textAlign: TextAlign.center,
  //             ),
  //           ],
  //         ),
  //         actions: const [],
  //       );
  //     },
  //   );
  // }

  // static Future<void> showAlartDialog({required BuildContext context, required String msg, void Function()? doneFun, List<Widget>? actions}) async {
  //   showDialog(
  //     barrierDismissible: true,
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //           actionsAlignment: MainAxisAlignment.center,
  //           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  //           title: Column(
  //             children: [
  //               SvgPicture.asset(
  //                 IconsPaths.danger,
  //                 height: 140.w,
  //                 width: 140.w,
  //               ),
  //               Text(
  //                 msg,
  //                 style: context.displayMediumH2.copyWith(color: AppColors.lightblackColor),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ],
  //           ),
  //           actionsPadding: const EdgeInsets.only(bottom: 25),
  //           actions: actions ??
  //               [
  //                 ClickButton(
  //                   onPressed: doneFun,
  //                   text: S.of(context)!.yes,
  //                   fontSize: 12,
  //                   width: 120.w,
  //                   height: 36,
  //                 ),
  //                 8.horizontalSpace,
  //                 ClickButton(
  //                   onPressed: () => popRoute(),
  //                   text: S.of(context)!.no,
  //                   btnColor: AppColors.whiteColor,
  //                   borderColor: AppColors.darkGreenColor,
  //                   textColor: AppColors.darkGreenColor,
  //                   fontSize: 12,
  //                   height: 36,
  //                   width: 120.w,
  //                 ),
  //               ]);
  //     },
  //   );
  // }

  static Future showLoaderDialog() async {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 155.w, vertical: 20),
      content: Container(
        // constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
        height: 100.w,
        //width: 90,
        decoration: BoxDecoration(
          color: ColorManager.scaffoldBGColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorManager.darkGrayColor, width: 2),
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: ColorManager.yellowColor,
          strokeWidth: 2,
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      barrierColor: ColorManager.lightGrayColor.withOpacity(0.4),
      context: AppKeys.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      timeInSecForIosWeb: 4,
      textColor: ColorManager.blackColor,
      backgroundColor: color ?? ColorManager.yellowColor,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static Future<void> showCustomTost(context, {String title = ''}) async {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: ColorManager.yellowColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: CustomText(
            title: title,
            align: TextAlign.center,
            color: ColorManager.blackColor,
          ).allPadding(15),
        );
      },
    );
  }

  static iPhoneLoading(BuildContext context, {Color? color, size = 15.0}) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
        radius: size,
      ),
    );
  }
}
