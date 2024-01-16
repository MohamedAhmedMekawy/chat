import 'package:chat_app/screens/views/chat_screen/chat_view.dart';
import 'package:chat_app/screens/views/chat_screen/chat_view_model.dart';
import 'package:chat_app/utils/app_utils/navigators.dart';
import 'package:chat_app/utils/ui_utils/ui_globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatSignUpViewModel with ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final credential = FirebaseAuth.instance;
  GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();
  bool showPassword = false;
  Future signUp(context) async {
    try {
      await credential.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      await credential.currentUser!.updateDisplayName(nameController.text);

      pushNewScreen(ChangeNotifierProvider(
          create: (context) => ChatViewModel(),
          child: ChatView(
            email: emailController.text,
          )));
      UIGlobal.showToast(
          color: Colors.green, msg: 'Create Account Successfully!');
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        UIGlobal.showCustomTost(context,
            title: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        UIGlobal.showCustomTost(context,
            title: 'The account already exists for that email.');
      }
    } catch (e) {
      UIGlobal.showCustomTost(context, title: e.toString());
      print(e.toString());
    }
  }

  setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
