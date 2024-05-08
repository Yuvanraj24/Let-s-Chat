import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Models/Chats/chat_list_model.dart';

class ChatController extends GetxController {
  RxList<ChatMessageModel> messages = RxList([
    ChatMessageModel(messageContent: "Hello, Will", messageType: "text",userType: "receiver"),
    ChatMessageModel(messageContent: "How have you been?", messageType: "text",userType: "receiver"),
    ChatMessageModel(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "text",userType: "sender"),
    ChatMessageModel(messageContent: "ehhhh, doing OK.", messageType: "text",userType: "receiver"),
    ChatMessageModel(messageContent: "Is there any thing wrong?", messageType: "text",userType: "sender"),
  ]);

  TextEditingController msgTxtCtrl = TextEditingController();

  sendMessage(String msg){
    messages.insert(0, ChatMessageModel(messageContent: msg, messageType: 'text', userType: 'Sender'));
    msgTxtCtrl.clear();
  }


}