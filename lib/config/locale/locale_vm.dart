import 'package:chat_app/data/local_storage/shared_preferences.dart';
import 'package:chat_app/resource/strings_manager.dart';
import 'package:chat_app/screens/views/chat_screen/chat_view.dart';
import 'package:chat_app/utils/app_utils/navigators.dart';
import 'package:flutter/material.dart';

class AppLanguage extends ChangeNotifier {
  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final String savedLangCode =
        Preference.getString(PrefKeys.languageCode) ?? AppStrings.englishCode;
    currentLangCode = savedLangCode;
    notifyListeners;
  }

  Future<void> _changeLang(String langCode) async {
    if (currentLangCode == langCode) {
      return;
    }

    if (langCode == AppStrings.arabicCode) {
      currentLangCode = AppStrings.arabicCode;
      await Preference.setString(PrefKeys.languageCode, AppStrings.arabicCode);
      pushNamedAndRemoveUntilRoute(ChatView.routeName);
    } else {
      currentLangCode = AppStrings.englishCode;
      await Preference.setString(PrefKeys.languageCode, AppStrings.englishCode);
      pushNamedAndRemoveUntilRoute(ChatView.routeName);
    }
    notifyListeners();
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
