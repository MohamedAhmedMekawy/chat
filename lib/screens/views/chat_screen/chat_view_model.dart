import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewModel with ChangeNotifier {
  final sendMessageController = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  Future addMessages(email) {
    return messages
        .add({
          'message': sendMessageController.text,
          'created_at': DateTime.now(),
          'id': email
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
