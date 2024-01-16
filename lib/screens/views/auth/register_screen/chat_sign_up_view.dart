import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/screens/views/auth/login_screen/chat_login_view.dart';
import 'package:chat_app/screens/views/auth/register_screen/chat_sign_up_view_model.dart';
import 'package:chat_app/screens/views/auth/register_screen/widget/signup_view.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/utils/app_utils/navigators.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatSignUpView extends StatelessWidget {
  static const String routeName = "/ChatSignUpView";

  const ChatSignUpView({super.key});

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
                title: S.of(context)!.welcome,
                color: ColorManager.offWhiteColor.withOpacity(.9),
                size: 21,
                fontWeight: FontWeight.normal,
              ),
              24.verticalSpace,
              ChangeNotifierProvider(
                create: (context) => ChatSignUpViewModel(),
                child: const SignUpView(),
              ),
            ],
          ).horizontalPadding(30),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title: S.of(context)!.alreadyHaveAnAccount,
            color: ColorManager.whiteColor,
            size: 13,
            fontWeight: FontWeight.w600,
          ),
          GestureDetector(
            onTap: () {
              pushNamedRoute(ChatLoginView.routeName);
            },
            child: CustomText(
              title: S.of(context)!.signin,
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
