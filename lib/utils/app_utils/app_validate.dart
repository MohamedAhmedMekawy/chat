import 'package:chat_app/config/locale/i18n.dart';
import 'package:flutter/material.dart';

class AppValidate {
  static emailValidate(String? text, BuildContext context) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (text == null || text.isEmpty) {
      return S.of(context)!.emptyEmail;
    } else if (!regex.hasMatch(text)) {
      return S.of(context)!.emailNotValid;
    }
    return null;
  }

  static phoneValidate(String? text, BuildContext context) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (text == null || text.isEmpty) {
      return S.of(context)!.emptyPhone;
    } else if (!regExp.hasMatch(text)) {
      return S.of(context)!.enterValidMobileNumber;
    }
    return null;
  }

  static passwordValidate(String? text, BuildContext context) {
    RegExp regExp = RegExp(r"^(?=.*[A-Z])(?=.*[0-9].*[0-9])(?=.*[a-z]).{8,}$");
    if (text == null || text.isEmpty) {
      return S.of(context)!.emptyPassword;
    } else if (!regExp.hasMatch(text)) {
      return S.of(context)!.passwordShouldBeMoreThan7Char;
    }
    return null;
  }

  static userNameValidate(String? text, BuildContext context) {
    RegExp regExp = RegExp(r'(^[a-zA-Z1-9]{3,}$)');

    if (text == null || text.isEmpty) {
      return S.of(context)!.emptyUserName;
    } else if (!regExp.hasMatch(text)) {
      return S.of(context)!.userNameShouldBeMoreThan2Char;
    }
    return null;
  }

  static confirmPasswordValidate(
    String? text,
    String? password,
    BuildContext context,
  ) {
    if (text == null || text.isEmpty) {
      return S.of(context)!.emptyConfirmPassword;
    } else if (text != password) {
      return S.of(context)!.confirmPasswordDoesntMatchWithPassword;
    }
    return null;
  }

  static required(String? text, BuildContext context) {
    if (text?.isEmpty == true) {
      return S.of(context)!.required;
    }
    return null;
  }
}
