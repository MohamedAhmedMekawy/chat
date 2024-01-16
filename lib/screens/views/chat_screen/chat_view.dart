import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/data/model/message.dart';
import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/screens/views/chat_screen/chat_view_model.dart';
import 'package:chat_app/screens/views/chat_screen/widgets/bubble_message.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  static const String routeName = "/ChatView";
  final String? email;
  final controller = ScrollController();
  ChatView({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    ChatViewModel chatViewModel = Provider.of(context, listen: false);
    Widget buildTextComposer() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
        child: CustomTextField(
          fillColor: ColorManager.scaffoldBGColor,
          hintText: S.of(context)!.typeYourMessage,
          borderRadius: 60.radius,
          hintColor: ColorManager.whiteColor,
          textInputAction: TextInputAction.newline,
          controller: chatViewModel.sendMessageController,
          suffixIcon: GestureDetector(
            onTap: () {
              try {
                if (chatViewModel.sendMessageController.text.isNotEmpty) {
                  chatViewModel.addMessages(email);
                  chatViewModel.sendMessageController.clear();
                  controller.animateTo(
                    0,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 500),
                  );
                  print('***************');
                }
              } catch (e) {
                debugPrint('seeeeeeeeeeeeeeeend msg Eerror $e');
                rethrow;
              }
            },
            child: Icon(
              Icons.send_rounded,
              color: ColorManager.yellowColor,
              size: 30.radius,
            ).horizontalPadding(10),
          ),
          // prefixIcon: Icon(
          //   Icons.attach_file_rounded,
          //   color: ColorManager.grayColor,
          //   size: 30.radius,
          // ),
        ),
      );
    }

    return StreamBuilder<QuerySnapshot>(
        stream: chatViewModel.messages
            .orderBy('created_at', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          List<Message> listMessage = [];
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              listMessage.add(
                Message.fromJson(snapshot.data!.docs[i]),
              );
              print(listMessage.length);
            }
            return Consumer<ChatViewModel>(builder: (context, vm, child) {
              return Scaffold(
                appBar: AppBar(),
                body: Column(
                  children: [
                    Flexible(
                      child: ListView.separated(
                        controller: controller,
                        separatorBuilder: (context, index) => 18.verticalSpace,
                        //physics: const BouncingScrollPhysics(),
                        // shrinkWrap: true,
                        reverse: true,
                        itemCount: listMessage.length,
                        itemBuilder: (context, index) => BubbleMessage(
                          msg: listMessage[index].message,
                          sentByMe: listMessage[index].id == email,
                        ),
                        // sentByMe: index.isOdd),
                      ),
                    ),
                    buildTextComposer(),
                  ],
                ),
              );
            });
          } else {
            return const Text('Loading....');
          }
        });
  }
}
