import 'package:chat_app/screens/views/auth/login_screen/chat_login_view.dart';
import 'package:chat_app/screens/views/auth/login_screen/chat_login_view_model.dart';
import 'package:chat_app/screens/views/auth/register_screen/chat_sign_up_view.dart';
import 'package:chat_app/screens/views/chat_screen/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes {
  static var routes = <String, WidgetBuilder>{
    ChatLoginView.routeName: (ctx) => ChangeNotifierProvider(
        create: (context) => ChatSignInViewModel(),
        child: const ChatLoginView()),
    ChatSignUpView.routeName: (ctx) => const ChatSignUpView(),
    ChatView.routeName: (ctx) => ChatView(),
  };

  static Route<BuildContext>? getRoutes(RouteSettings settings) {
    var builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: builder,
      );
    }
    return null;
  }
}
