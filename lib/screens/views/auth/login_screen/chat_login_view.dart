import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/screens/views/auth/login_screen/widget/login_view.dart';
import 'package:chat_app/screens/views/auth/register_screen/chat_sign_up_view.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/utils/app_utils/navigators.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ChatLoginView extends StatelessWidget {
  static const String routeName = "/";

  const ChatLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              40.verticalSpace,
              CustomText(
                title: S.of(context)!.welcomeBack,
                color: ColorManager.offWhiteColor.withOpacity(.9),
                size: 21,
                fontWeight: FontWeight.normal,
              ),
              20.verticalSpace,
              // ChangeNotifierProvider(
              //     create: (context) => LoginViewModel(),
              //     child: const
              const LoginView()
            ],
          ).horizontalPadding(30),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title: S.of(context)!.dontHaveAnAccount,
            color: ColorManager.whiteColor,
            size: 13,
            fontWeight: FontWeight.w600,
          ),
          GestureDetector(
            onTap: () {
              pushNamedRoute(ChatSignUpView.routeName);
            },
            child: CustomText(
              title: S.of(context)!.createNewOne,
              color: ColorManager.yellowColor,
              size: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ).verticalPadding(14),
    );
  }
}
