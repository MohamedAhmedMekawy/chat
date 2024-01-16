import 'package:chat_app/config/locale/locale_vm.dart';
import 'package:chat_app/config/routes/routes_manager.dart';
import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/provider/provider_set_up.dart';
import 'package:chat_app/resource/app_keys.dart';
import 'package:chat_app/resource/strings_manager.dart';
import 'package:chat_app/utils/app_utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/locale/i18n.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: Consumer<AppLanguage>(
            builder: (context, model, child) {
              debugPrint("currentLangCode ============> ${model.currentLangCode}");
              SizeUtil.init(
                context,
                designSize: const Size(428, 926),
                minTextAdapt: true,
                splitScreenMode: true,
              );
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: AppKeys.navigatorKey,
              title: AppStrings.appName,
              locale: Locale(model.currentLangCode, ""),
              localizationsDelegates: const [S.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
              supportedLocales: S.delegate.supportedLocales,
              localeListResolutionCallback: S.delegate.listResolution(fallback: const Locale('en', '')),
              routes: Routes.routes,
              onGenerateRoute: Routes.getRoutes,
              theme: appTheme(),
            );
          }
        ));
  }
}
