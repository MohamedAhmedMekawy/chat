import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/resource/assets_manager.dart';
import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNoDataWidget extends StatelessWidget {
  final String? msg;

  const CustomNoDataWidget({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            ImageAssets.empty,
            height: 100.w,
            width: 100.w,
            color: ColorManager.yellowColor,
          ),
        ),
        CustomText(
          title: msg ?? S.of(context)!.noDataAdded,
          size: 20,
          color: ColorManager.offWhiteColor,
          align: TextAlign.center,
        ).allPadding(20)
      ],
    );
  }
}
