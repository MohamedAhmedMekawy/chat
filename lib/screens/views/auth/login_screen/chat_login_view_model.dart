import 'package:chat_app/screens/views/chat_screen/chat_view.dart';
import 'package:chat_app/screens/views/chat_screen/chat_view_model.dart';
import 'package:chat_app/utils/app_utils/navigators.dart';
import 'package:chat_app/utils/ui_utils/ui_globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatSignInViewModel with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final credential = FirebaseAuth.instance;
  GlobalKey<FormState> singInFormKey = GlobalKey<FormState>();
  bool showPassword = false;
  Future signIn(context) async {
    try {
      await credential.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      pushNewScreen(ChangeNotifierProvider(
          create: (context) => ChatViewModel(),
          child: ChatView(
            email: emailController.text,
          )));
      UIGlobal.showToast(color: Colors.green, msg: 'Login Successfully!');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        UIGlobal.showCustomTost(context,
            title: 'No user found for that email.');
        print('${e.code}**********************');
      } else if (e.code == 'wrong-password') {
        UIGlobal.showCustomTost(context,
            title: 'Wrong password provided for that user.');
      } else {
        UIGlobal.showToast(color: Colors.red, msg: 'Email Vaild!');
      }
    }
  }

  setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
