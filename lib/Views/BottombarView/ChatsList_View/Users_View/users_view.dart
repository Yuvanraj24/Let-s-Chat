import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Models/Chats/chat_list_model.dart';
import 'package:lets_chat/ViewModels/Chats/ChatsList_Controller/chat_list_controller.dart';
import 'package:lets_chat/ViewModels/Chats/Users_Controller/users_controller.dart';
import 'package:lets_chat/Views/BottombarView/ChatMessage_View/chat_msg_view.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UsersController());
    final chatListCtrl = Get.put(ChatsListController());
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            Obx(
              () =>  ListView.separated(
                  itemCount: userController.usersList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index){
                    UserModel user = userController.usersList[index];
                    return ListTile(
                      tileColor: Colors.white30,
                      leading: CircleAvatar(
                        child: Center(
                          child: Text(user.userName.split('').first.toUpperCase()),
                        ),
                      ),
                      title: Text(user.userName),
                      subtitle: Text(user.userMail),
                      trailing: const Icon(Icons.arrow_right),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      onTap: (){
                        chatListCtrl.currentReceiver.value = user.userId;
                        Get.to(ChatMsgView(receiverName: user.userName, imageUrl: '', receiverId: user.userId,));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
