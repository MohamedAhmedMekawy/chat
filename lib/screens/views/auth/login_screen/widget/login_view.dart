import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/screens/views/auth/login_screen/chat_login_view_model.dart';
import 'package:chat_app/utils/app_utils/app_validate.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "/login";

  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChatSignInViewModel loginViewModel = Provider.of(context, listen: false);

    return SingleChildScrollView(
        child: Form(
      key: loginViewModel.singInFormKey,
      child: Column(
        children: [
          26.verticalSpace,
          // email Address text field
          CustomTextField(
            hintText: S.of(context)!.emailAddress,
            controller: loginViewModel.emailController,
            type: TextInputType.emailAddress,
            validator: (text) => AppValidate.emailValidate(text, context),
          ),
          //password text field
          8.verticalSpace,
          CustomTextField(
            hintText: S.of(context)!.password,
            textInputAction: TextInputAction.done,
            type: TextInputType.visiblePassword,
            changePasswordVisablity: () => loginViewModel.setShowPassword(),
            obscureText: !context.watch<ChatSignInViewModel>().showPassword,
            controller: loginViewModel.passwordController,
            validator: (text) => AppValidate.passwordValidate(text, context),
          ),
          10.verticalSpace,
          // //***** *isRemmberMe
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Consumer<LoginViewModel>(builder: (_, vm, __) {
          //       return CustomRadioButton(
          //         value: vm.isRemmberMe,
          //         title: S.of(context)!.rememberMe,
          //         onTap: () {
          //           vm.setRememberMe();
          //         },
          //       );
          //     }),
          //     const Spacer(),
          //     GestureDetector(
          //       onTap: () {
          //         pushNewScreen(const ForgetPasswordView());
          //         //pushNamedRoute(ForgetPasswordView.routeName);
          //       },
          //       child: CustomText(
          //         title: S.of(context)!.forgetPassword,
          //         color: ColorManager.yellowColor,
          //         size: 13,
          //       ),
          //     ),
          //   ],
          // ),
          18.verticalSpace,

          CustomButton(
            onTap: () async {
              if (loginViewModel.singInFormKey.currentState!.validate()) {
                await loginViewModel.signIn(context);
              }
            },
            btnTextSize: 15,
            text: S.of(context)!.signin,
          ),

          50.verticalSpace,
        ],
      ),
    ));
  }
}
