import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/screens/views/auth/register_screen/chat_sign_up_view_model.dart';
import 'package:chat_app/utils/app_utils/app_validate.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = "/signup";

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    ChatSignUpViewModel signUpViewModel = Provider.of(context, listen: false);

    return SingleChildScrollView(
      child: Form(
        key: signUpViewModel.singupFormKey,
        child: Column(
          children: [
            26.verticalSpace,
            // user name text field
            CustomTextField(
              hintText: S.of(context)!.userName,
              controller: signUpViewModel.nameController,
              validator: (text) => AppValidate.userNameValidate(text, context),
            ),

            // email Address text field
            CustomTextField(
              hintText: S.of(context)!.emailAddress,
              controller: signUpViewModel.emailController,
              type: TextInputType.emailAddress,
              validator: (text) => AppValidate.emailValidate(text, context),
            ),

            //password text field
            CustomTextField(
              hintText: S.of(context)!.password,
              textInputAction: TextInputAction.done,
              type: TextInputType.visiblePassword,
              changePasswordVisablity: () => signUpViewModel.setShowPassword(),
              obscureText: !context.watch<ChatSignUpViewModel>().showPassword,
              controller: signUpViewModel.passwordController,
              validator: (text) => AppValidate.passwordValidate(text, context),
            ),
            6.verticalSpace,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Consumer<SingupViewModel>(builder: (_, vm, __) {
            //       return CustomRadioButton(
            //         value: vm.acceptTerms,
            //         onTap: () => signUpViewModel.setAcceptTerms(),
            //         title: S.of(context)!.iAgreeWith,
            //       );
            //     }),
            //     GestureDetector(
            //       onTap: () => pushNamedRoute(TermsView.routeName),
            //       child: CustomText(
            //         title: S.of(context)!.termConditions,
            //         color: ColorManager.yellowColor,
            //         size: 14,
            //       ),
            //     ),
            //   ],
            // ),
            // 18.verticalSpace,
            // Consumer<SingupViewModel>(builder: (_, vm, __) {
            //   return
            Center(
              child: CustomButton(
                onTap: () async {
                  if (signUpViewModel.singupFormKey.currentState!.validate()) {
                    await signUpViewModel.signUp(context);
                  }
                  // } else {
                  //   UIGlobal.showCustomTost(context, title: S.of(context)!.acceptTermsAndConditions);
                  // }
                },
                btnTextSize: 16,
                text: S.of(context)!.signup,
              ),
            ),

            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
