import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/ViewModels/Chats/Chat_Controller/chat_controller.dart';

class ChatMsgView extends StatelessWidget {
  final String receiverName;
  final String imageUrl;
  final String receiverId;
  const ChatMsgView({
    required this.receiverName,
    required this.imageUrl,
    required this.receiverId,
    super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  const SizedBox(width: 2,),
                   imageUrl.isNotEmpty?
                   CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    maxRadius: 20,
                  ):
                   CircleAvatar(
                    child: Center(
                      child: Text(receiverName.split('').first),
                    )),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(receiverName,style: const TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 6),
                        Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                   const Icon(Icons.settings,color: Colors.black54,),
                ],
              ),
            ),
          ),
        ),
      body: Stack(
        children: <Widget>[
          Obx(
            () => ListView.builder(
              reverse: true,
              itemCount: chatController.messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10,bottom: 50),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (chatController.messages[index].userType == "receiver"?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (chatController.messages[index].userType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(chatController.messages[index].messageContent, style: const TextStyle(fontSize: 15),),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                   Expanded(
                    child: TextField(
                      controller: chatController.msgTxtCtrl,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: () => chatController.sendMessage(chatController.msgTxtCtrl.text, receiverId, 'text'),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    child: const Icon(Icons.send,color: Colors.white,size: 18,),
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
