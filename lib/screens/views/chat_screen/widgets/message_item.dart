import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_avtar_image_widget.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  // final ChatsModel dialog;
  const MessageItem({
    super.key,
    // required this.dialog,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.h,
      margin: 30.hPadding,
      padding: 20.hPadding + 20.vPadding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.darkGrayColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomAvtarImageWidget(
                  // imageUrl: dialog.dialogImg ?? '',
                  radius: 30.radius,
                  imageAsset: true),
              10.horizontalSpace,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: 'Mohamed',
                          size: 12,
                          color: ColorManager.offWhiteColor,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Flexible(
                          flex: 2,
                          child: CustomText(
                            title: '14:20',
                            size: 12,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            color: ColorManager.yellowColor,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    CustomText(
                      title: '',
                      size: 12,
                      color: ColorManager.offWhiteColor.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //10.verticalSpace,
        ],
      ),
    );
  }
}




// import 'package:elance/data/models/chat/dialog_data.dart';
// import 'package:elance/resource/color_manager.dart';
// import 'package:elance/utils/extensions.dart';
// import 'package:elance/widgets/custom_avtar_image_widget.dart';
// import 'package:elance/widgets/custom_text.dart';
// import 'package:flutter/material.dart';

// class MessageItem extends StatelessWidget {
//   final ChatsModel dialog;
//   const MessageItem({
//     super.key,
//     required this.dialog,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       selected: true,
//       selectedTileColor: Colors.transparent,
//       contentPadding: EdgeInsetsDirectional.only(start: 40.w, end: 20.w),
//       leading: CustomAvtarImageWidget(
//         imageUrl: dialog.dialogImg ?? '',
//         radius: 30.radius,
//         imageAsset: dialog.dialogImg == null,
//       ).horizontalPadding(10),
//       title: CustomText(
//         title: dialog.dialogName ?? '',
//         size: 12,
//         fontWeight: FontWeight.w600,
//         color: ColorManager.blackColor,
//       ),
//       subtitle: CustomText(
//         title: dialog.lastMessage?.content ?? '',
//         size: 12,
//         maxLines: 1,
//         textOverflow: TextOverflow.ellipsis,
//         fontWeight: FontWeight.w300,
//         color: ColorManager.primaryColor,
//       ),
//       trailing: CustomText(
//         title: dialog.lastMessage?.createdAt ?? '',
//         size: 10,
//         fontWeight: FontWeight.w600,
//         color: ColorManager.accentColor,
//       ),
//     );
//   }
// }
