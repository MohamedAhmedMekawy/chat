// import 'package:elance/config/locale/i18n.dart';
// import 'package:elance/resource/color_manager.dart';
// import 'package:elance/resource/constants_manager.dart';
// import 'package:elance/utils/app_utils/extentions.dart';

// import 'package:elance/widgets/custom_button.dart';
// import 'package:elance/widgets/custom_text.dart';
// import 'package:flutter/material.dart';

// class CustomPop extends StatelessWidget {
//   final Function()? primaryButtonAction;
//   final Function()? secondaryButtonAction;
//   final String? popTitle;
//   final String? popBody;
//   final bool withTwoButton;
//   final bool withTwoText;
//   final bool withOneButton;

//   const CustomPop(
//       {Key? key,
//       this.popTitle,
//       this.withTwoButton = false,
//       this.withOneButton = false,
//       this.withTwoText = false,
//       this.popBody,
//       this.primaryButtonAction,
//       this.secondaryButtonAction})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 1.heightPercentage * .12),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Material(
//           color: Colors.transparent,
//           child: Directionality(
//             textDirection: Localizations.localeOf(context).languageCode == 'en'
//                 ? TextDirection.ltr
//                 : TextDirection.rtl,
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               height: 1.heightPercentage * 0.3,
//               width: 1.widthPercentage * 0.8,
//               child: Column(
//                 children: [
//                   Visibility(
//                     visible: popTitle != null,
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 20, bottom: 30),
//                       width: 1.widthPercentage * 0.7,
//                       child: CustomText(
//                         title: popTitle,
//                         size: FontSize.s20,
//                         align: TextAlign.center,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),

//                   Container(
//                     margin: EdgeInsets.only(
//                         top: popTitle == null ? 1.heightPercentage * 0.01 : 0),
//                     width: 1.widthPercentage * 0.7,
//                     child: CustomText(
//                       title: popBody,
//                       size: FontSize.s18,
//                       align: TextAlign.center,
//                       textOverflow: TextOverflow.visible,
//                       color: Colors.black,
//                       maxLines: 2,
//                     ),
//                   ),

//                   const Spacer(),

//                   // two buttons
//                   Visibility(
//                     visible: withTwoButton,
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 1.heightPercentage * 0.03,
//                           left: 1.widthPercentage * 0.05,
//                           right: 1.widthPercentage * 0.05),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           //Register button

//                           Expanded(
//                             child: CustomButton(
//                               btnHeight: 1.heightPercentage *
//                                   AppConstants.heightButtonStandardPercentage,
//                               onTap: primaryButtonAction!,
//                               text: S.of(context)!.register,
//                               btnColor: Colors.white,
//                               borderColor: ColorManager.primaryColor,
//                             ),
//                           ),

//                           SizedBox(width: 1.widthPercentage * 0.05),

//                           //login button
//                           Expanded(
//                             child: CustomButton(
//                               btnWidth: 1.widthPercentage * 0.28,
//                               btnHeight: 1.heightPercentage *
//                                   AppConstants.heightButtonStandardPercentage,
//                               onTap: secondaryButtonAction!,
//                               text: S.of(context)!.logIn,
//                               btnColor: ColorManager.primaryColor,
//                               borderColor: ColorManager.primaryColor,
//                               btnTextColor: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   Visibility(
//                     visible: withTwoText,
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 1.heightPercentage * 0.03,
//                           left: 1.widthPercentage * 0.1,
//                           right: 1.widthPercentage * 0.1),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           //Register button

//                           Expanded(
//                             child: GestureDetector(
//                               onTap: primaryButtonAction,
//                               child: const CustomText(
//                                 align: TextAlign.center,
//                                 title: 'cancel',
//                                 color: ColorManager.mainText,
//                               ),
//                             ),
//                           ),

//                           SizedBox(width: 1.widthPercentage * 0.05),

//                           Expanded(
//                             child: GestureDetector(
//                               onTap: secondaryButtonAction,
//                               child: const CustomText(
//                                 align: TextAlign.center,
//                                 title: 'yes',
//                                 color: ColorManager.mainText,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   //Register button
//                   Visibility(
//                     visible: withOneButton,
//                     child: CustomButton(
//                       btnWidth: 1.widthPercentage * 0.28,
//                       btnHeight: 1.heightPercentage *
//                           AppConstants.heightButtonStandardPercentage,
//                       onTap: primaryButtonAction!,
//                       text: S.of(context)!.register,
//                       btnColor: Colors.white,
//                       borderColor: ColorManager.primaryColor,
//                     ),
//                   ),

//                   SizedBox(height: 1.heightPercentage * 0.01),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
