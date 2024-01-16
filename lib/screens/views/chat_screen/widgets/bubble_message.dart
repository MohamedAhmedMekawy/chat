import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';

class BubbleMessage extends StatelessWidget {
  final bool sentByMe;
  final String? msg;

  //final ChatsModel? dialg;
  const BubbleMessage({
    super.key,
    required this.sentByMe,
    this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: sentByMe
                ? AlignmentDirectional.centerEnd
                : AlignmentDirectional.centerStart,
            child: Container(
              padding: 15.hPadding + 5.vPadding,
              constraints: BoxConstraints(
                  maxWidth: 0.75.widthPercentage,
                  minWidth: 0.25.widthPercentage),
              // alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsetsDirectional.only(
                top: 10.h,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.radius),
                  topEnd: Radius.circular(20.radius),
                  bottomEnd:
                      !sentByMe ? Radius.circular(20.radius) : Radius.zero,
                  bottomStart:
                      sentByMe ? Radius.circular(20.radius) : Radius.zero,
                ),
                color:
                    sentByMe ? ColorManager.yellowColor : ColorManager.redColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    title: msg ?? '',
                    color: sentByMe
                        ? ColorManager.offWhiteColor
                        : ColorManager.whiteColor,
                  ),
                  5.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ],
    ).horizontalPadding(24);
  }
}


  // index.isOdd
  //                           ? Wrap(children:
  //                           [
  //                               Row(
  //                                 crossAxisAlignment: CrossAxisAlignment.end,
  //                                 mainAxisAlignment: MainAxisAlignment.end,
  //                                 children: [
  //                                   Align(
  //                                     alignment: Alignment.bottomRight,
  //                                     child: ClipRRect(
  //                                       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .07),
  //                                       child: Image.asset(
  //                                         'assets/images/company.png',
  //                                         width: MediaQuery.of(context).size.height * .06,
  //                                         height: MediaQuery.of(context).size.height * .06,
  //                                         fit: BoxFit.cover,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   SizedBox(
  //                                     width: MediaQuery.of(context).size.width * .04,
  //                                   ),
  //                                   Expanded(
  //                                     child: Container(
  //                                       width: double.infinity,
  //                                       decoration: BoxDecoration(
  //                                           color: HexColor('#0F0E0E'),
  //                                           borderRadius: BorderRadiusDirectional.only(
  //                                             topStart: Radius.circular(MediaQuery.of(context).size.width * .04),
  //                                             topEnd: Radius.circular(MediaQuery.of(context).size.width * .04),
  //                                             bottomEnd: Radius.circular(MediaQuery.of(context).size.width * .04),
  //                                           )),
  //                                       child: Padding(
  //                                         padding: EdgeInsets.all(MediaQuery.of(context).size.width * .04),
  //                                         child: Wrap(children: [
  //                                           Column(
  //                                             crossAxisAlignment: CrossAxisAlignment.start,
  //                                             mainAxisAlignment: MainAxisAlignment.center,
  //                                             children: [
  //                                               Text('Nullam desing vitae arcu quis min convallis ullamcor nunc ',
  //                                                   style: TextStyle(height: 1.2, color: HexColor('#F0EEEE'), fontSize: 14.sp, fontWeight: FontWeight.w200)),
  //                                               SizedBox(
  //                                                 height: MediaQuery.of(context).size.width * .03,
  //                                               ),
  //                                               Text('19:30', style: TextStyle(height: 1.2, color: HexColor('#F0EEEE'), fontSize: 14.sp, fontWeight: FontWeight.w200)),
  //                                             ],
  //                                           ),
  //                                         ]),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ])
  //                           : Row(
  //                               children: [
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width / 6,
  //                                 ),
  //                                 Expanded(
  //                                   child: Container(
  //                                     width: double.infinity,
  //                                     decoration: BoxDecoration(
  //                                         color: HexColor('#E1B438'),
  //                                         borderRadius: BorderRadiusDirectional.only(
  //                                           topStart: Radius.circular(MediaQuery.of(context).size.width * .04),
  //                                           topEnd: Radius.circular(MediaQuery.of(context).size.width * .04),
  //                                           bottomStart: Radius.circular(MediaQuery.of(context).size.width * .04),
  //                                         )),
  //                                     child: Padding(
  //                                       padding: EdgeInsets.all(MediaQuery.of(context).size.width * .04),
  //                                       child: Wrap(children: [
  //                                         Column(
  //                                           crossAxisAlignment: CrossAxisAlignment.start,
  //                                           children: [
  //                                             Text('Nothing planned, and you?', style: TextStyle(height: 1.2, color: HexColor('#F0EEEE'), fontSize: 14.sp, fontWeight: FontWeight.w200)),
  //                                             SizedBox(
  //                                               height: MediaQuery.of(context).size.width * .03,
  //                                             ),
  //                                             Row(
  //                                               children: [
  //                                                 const Spacer(),
  //                                                 Text('19:30', style: TextStyle(height: 1.2, color: HexColor('#F0EEEE'), fontSize: 14.sp, fontWeight: FontWeight.w200)),
  //                                               ],
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ]),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),