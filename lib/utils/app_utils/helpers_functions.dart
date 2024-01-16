import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static bool isTablet = 1.widthPercentage > 600 ? true : false;
  // static void copyText(context, {required String text}) {
  //   Clipboard.setData(
  //     ClipboardData(text: text),
  //   ).then(
  //     (value) {
  //       UIGlobal.showToast(msg: S.of(context)!.copied);
  //     },
  //   );
  // }

  // static Future<void> openGoogleMap(
  //     String? latitude, String? longitude, context) async {
  //   String googleUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  //   if (await canLaunchUrl(Uri.parse(googleUrl))) {
  //     await launchUrl(Uri.parse(googleUrl));
  //   } else {
  //     UIGlobal.showToast(
  //         msg: S.of(context)!.openMapError, color: AppColors.blackColor);
  //     throw 'Could not open the map';
  //   }
  // }

  // static openEmail(context, String email) async {
  //   final Uri emailLaunchUri = Uri(
  //       scheme: 'mailto',
  //       path: email,
  //       queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});
  //   if (await canLaunchUrl(emailLaunchUri)) {
  //     await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
  //   } else {
  //     UIGlobal.showToast(
  //         msg: S.of(context)!.sendEmailError, color: AppColors.blackColor);
  //   }
  // }

  // static openTwitter(context, String twitter) async {
  //   final Uri twitterLaunchUri =
  //       Uri(scheme: 'https', path: 'twitter.com/$twitter');
  //   if (await canLaunchUrl(twitterLaunchUri)) {
  //     await launchUrl(twitterLaunchUri, mode: LaunchMode.externalApplication);
  //   } else {
  //     UIGlobal.showToast(
  //         msg: S.of(context)!.openTiwtterError, color: AppColors.blackColor);
  //   }
  // }

  // static Future<void> openAppleMap(
  //     double latitude, double longitude, context) async {
  //   String googleUrl = 'https://maps.apple.com/?q=$latitude,$longitude';
  //   if (await canLaunchUrl(Uri.parse(googleUrl))) {
  //     await launchUrl(Uri.parse(googleUrl));
  //   } else {
  //     UIGlobal.showToast(
  //         msg: S.of(context)!.openMapError, color: AppColors.blackColor);
  //     throw 'Could not open the map';
  //   }
  // }

  static launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // static openWhatsapp(context, String whatsapp) async {
  //   String url =
  //       "https://wa.me/$whatsapp/?text=${Uri.encodeFull("Hello World !! Hey There")}";
  //   final Uri whatsappURlAndroid = Uri.parse(url);

  //   // android , web
  //   if (await canLaunchUrl(whatsappURlAndroid)) {
  //     await launchUrl(whatsappURlAndroid, mode: LaunchMode.externalApplication);
  //   } else {
  //     UIGlobal.showToast(
  //         msg: S.of(context)!.openwhatsappError, color: AppColors.blackColor);
  //   }
  // }

  // static textMe(context, phoneNumber) async {
  //   // Android
  //   final Uri smsLaunchUri = Uri(
  //     scheme: 'sms',
  //     path: '$phoneNumber',
  //     queryParameters: <String, String>{
  //       'body': Uri.encodeComponent('hello%20there'),
  //     },
  //   );

  //   if (await canLaunchUrl(smsLaunchUri)) {
  //     if (Platform.isAndroid) {
  //       await launchUrl(smsLaunchUri);
  //     } else if (Platform.isIOS) {
  //       // iOS
  //       await launchUrl(smsLaunchUri);
  //     }
  //   } else {
  //     UIGlobal.showToast(
  //         msg: S.of(context)!.openSMSError, color: AppColors.blackColor);
  //   }
  // }

  // static launchCaller(context, phoneNumber) async {
  //   final Uri callLaunchUri = Uri(scheme: 'tel', path: '$phoneNumber');

  //   try {
  //     if (await canLaunchUrl(callLaunchUri)) {
  //       await launchUrl(callLaunchUri);
  //     } else {
  //       UIGlobal.showToast(
  //           msg: S.of(context)!.openCallerError, color: AppColors.blackColor);
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // static String covertTime(String? time) {
  //   return DateFormat.jm()
  //       .format(DateFormat("hh:mm:ss").parse(time ?? '00:00:00'));
  // }

  static Future<DateTime?> showDateTime(BuildContext context,
      {DateTime? initialDate, DateTime? startDate, DateTime? endDate}) async {
    //DateTime initialData = initialDate ?? defineInitialDate(workDays, DateTime.now());

    try {
      final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: startDate ?? DateTime.now(),
        lastDate: endDate ?? DateTime(2100),
        initialDate: initialDate ?? DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                // change the border color
                primary: ColorManager.scaffoldBGColor,
                onSurface: ColorManager.scaffoldBGColor,
                background: ColorManager.scaffoldBGColor,
              ),
              // button colors
              buttonTheme: const ButtonThemeData(
                colorScheme:
                    ColorScheme.light(primary: ColorManager.yellowColor),
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        debugPrint(
            "Selected date: ${picked.year}-${picked.month}-${picked.day}");
        return picked;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
      //return null;
    }
  }
}

Future<TimeOfDay?> showPickerTime(BuildContext context) async {
  try {
    TimeOfDay timeFrom = TimeOfDay.now();

    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeFrom.replacing(hour: timeFrom.hourOfPeriod),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              // change the border color
              primary: ColorManager.scaffoldBGColor,
              onSurface: ColorManager.scaffoldBGColor,
              background: ColorManager.scaffoldBGColor,
            ),
            // button colors
            buttonTheme: const ButtonThemeData(
              colorScheme: ColorScheme.light(primary: ColorManager.yellowColor),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      // DateTime date = DateTime.now();
      // String second = date.second.toString().padLeft(2, '0');
      // List timeSplit = picked.format(context).split(' ');
      // String formattedTime = timeSplit[0];
      // String time = '$formattedTime:$second';
      // print(time); //
      return picked;
    } else {
      return null;
    }
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}
