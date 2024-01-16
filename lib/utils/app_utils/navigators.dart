import 'package:chat_app/resource/app_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

void pushNewScreen(Widget widget) {
  AppKeys.navigatorKey.currentState!
      .push(CupertinoPageRoute(builder: (context) => widget));
}

void pushNewScreenWithProvider(
    BuildContext context, Widget screen, ChangeNotifier provider,
    {arguments}) {
  Navigator.push(
    context,
    CupertinoPageRoute(
        builder: (context) => ChangeNotifierProvider(
              create: (context) => provider,
              child: screen,
            ),
        settings: RouteSettings(arguments: arguments)),
  );
}

void pushReplacementScreen(Widget widget) {
  AppKeys.navigatorKey.currentState!
      .pushReplacement(CupertinoPageRoute(builder: (context) => widget));
}

void pushNamedRoute(String route, {arguments}) {
  AppKeys.navigatorKey.currentState!.pushNamed(route, arguments: arguments);
}

pushReplacementNamedRoute(String screen, {arguments}) {
  AppKeys.navigatorKey.currentState!
      .pushReplacementNamed(screen, arguments: arguments);
}

pushNamedAndRemoveUntilRoute(String pushNamedAndRemoveUntil, {arguments}) {
  AppKeys.navigatorKey.currentState!.pushNamedAndRemoveUntil(
    pushNamedAndRemoveUntil,
    (_) => false,
  );
}

void pushAndRemoveUntilScreen(Widget screen) {
  AppKeys.navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false);
}

void navigateAndDeleteAllBackStacks(BuildContext context, String route,
    {arguments}) {
  SchedulerBinding.instance.addPostFrameCallback((_) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        route, (Route<dynamic> route) => false,
        arguments: arguments);
  });
}

void popRoute() {
  if (AppKeys.navigatorKey.currentState!.canPop()) {
    AppKeys.navigatorKey.currentState!.pop();
  }
}

void pushReplacementScreenWithoutAnimation(Widget widget) {
  AppKeys.navigatorKey.currentState!.pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}

void pushNewScreenWithoutAnimation(Widget widget) {
  AppKeys.navigatorKey.currentState!.pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}
