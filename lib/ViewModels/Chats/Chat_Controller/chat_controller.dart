import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Models/Chats/chat_list_model.dart';
import 'package:lets_chat/ViewModels/Chats/ChatsList_Controller/chat_list_controller.dart';

class ChatController extends GetxController {
  RxList<ChatMessageModel> messages = RxList([]);

  ChatsListController chatsListController = Get.put(ChatsListController());


  TextEditingController msgTxtCtrl = TextEditingController();
  sendMessage(String msg, String receiverId, String msgType){
    DateTime msgTime = DateTime.now();
    var chatsCollection = FirebaseFirestore.instance.collection('messages').doc(msgTime.millisecondsSinceEpoch.toString());
    chatsCollection.get().then((docSnap) {
      chatsCollection.set(
          {
            "sender": FirebaseAuth.instance.currentUser!.uid,
            "receiver": receiverId,
            "messageType" : msgType,
            "message" : msg,
            "msgTime" : msgTime.millisecondsSinceEpoch,
            "msgId" : msgTime.millisecondsSinceEpoch.toString()
          });


      FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        "opponentsId" : FieldValue.arrayUnion([receiverId]),
        receiverId : {
          "lastMsg" : msg,
          "lastMsgTime" : msgTime.millisecondsSinceEpoch
        }
      });

      FirebaseFirestore.instance.collection('users').doc(receiverId).update({
        "opponentsId" : FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
        FirebaseAuth.instance.currentUser!.uid : {
          "lastMsg" : msg,
          "lastMsgTime" : msgTime.millisecondsSinceEpoch
        }
      });

    });

    msgTxtCtrl.clear();
  }

  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    FirebaseFirestore.instance.collection('messages').where(
        Filter.or(
            Filter.and(Filter("sender" , isEqualTo: FirebaseAuth.instance.currentUser!.uid), Filter("receiver", isEqualTo: chatsListController.currentReceiver.value)),
            Filter.and(Filter("receiver" , isEqualTo: FirebaseAuth.instance.currentUser!.uid), Filter("sender", isEqualTo: chatsListController.currentReceiver.value))
        )
    ).snapshots().listen((messagesSnap) {
      messages.clear();
      print('cccc ---> ${messagesSnap.docs.length}');
      for(var i in messagesSnap.docs){
        messages.insert(
            0,
            ChatMessageModel(
                messageContent: i['message'], messageType: i['messageType'],
            userType: i['sender']==FirebaseAuth.instance.currentUser!.uid?"sender":"receiver",
                msgId: i['msgId'],
                msgTime: i['msgTime'].toString()
        ));
      }
    });


  }




}