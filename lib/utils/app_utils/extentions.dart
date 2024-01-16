import 'dart:convert';
import 'dart:io';
import 'package:chat_app/utils/app_utils/size_util.dart';
import 'package:flutter/material.dart';

String fileToBase64(File file) {
  return base64Encode(file.readAsBytesSync());
}

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

//for list sort
extension MyIterable<E> on Iterable<E> {
  Iterable<E> sortedBy(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));
}

extension ValidEmail on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension ValidPhone on String {
  bool isValidPhone() {
    //  return RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]{10}").hasMatch(this);
    return RegExp(r"^(?:[+0]9)?[0-9-٠-٩]{10,12}$").hasMatch(this);
  }
}

//! numbers

extension AppNumberExtension on num {
  //*take unit of width or height
  double get w => SizeUtil().setWidth(this);
  double get h => SizeUtil().setHeight(this);

//*make font Adaptivity,
  double get radius => SizeUtil().radius(this);

  //* take unit of from minim scaleWidth, scaleHeight
  double get sp => SizeUtil().setSp(this);

  //*take %  of width or height
  double get widthPercentage => SizeUtil().screenWidth * this;
  double get heightPercentage => SizeUtil().screenHeight * this;

  //*********** SizedBox **********
  SizedBox get verticalSpace => SizeUtil().setVerticalSpacing(this);
  SizedBox get horizontalSpace => SizeUtil().setHorizontalSpacing(this);

  //* Padding
  EdgeInsets get allPadding => EdgeInsets.all(toDouble().radius);
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble().w);
}

//* Margin
extension TimeOfDayExtension on TimeOfDay {
  double get timeToDouble => hour + minute / 60.0;
}

//! WidgetExtension
extension WidgetExtension on Widget {
  Widget horizontalPadding(double padding) => Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w), child: this);
  Widget verticalPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding.h), child: this);
  Widget allPadding(double padding) =>
      Padding(padding: EdgeInsets.all(padding.radius), child: this);
  Widget center() => Center(child: this);
}

extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
