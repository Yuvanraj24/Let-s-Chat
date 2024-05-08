import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Views/BottombarView/ChatMessage_View/chat_msg_view.dart';

class ChatsListTile extends StatelessWidget {
  final String name;
  final String lastMsg;
  final String imageUrl;
  final String time;
  final bool isMessageRead;
  const ChatsListTile({
    required this.name, required this.lastMsg, required this.imageUrl, required this.time, required this.isMessageRead,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ChatMsgView(receiverName: name, imageUrl: imageUrl)),
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    maxRadius: 30,
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name, style: const TextStyle(fontSize: 16),),
                          const SizedBox(height: 6,),
                          Text(lastMsg,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(time,style: TextStyle(fontSize: 12,fontWeight:isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
