import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Models/Chats/chat_list_model.dart';
import 'package:lets_chat/ViewModels/Chats/Users_Controller/users_controller.dart';

class ChatsListController extends GetxController {

  UsersController usersController = Get.put(UsersController());
  RxList<ChatListModel> chatUsers = RxList([]);

  RxString currentReceiver = RxString('');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots().listen((chatsListSnapShot) {
      List chatList = chatsListSnapShot.get("opponents");
      chatUsers.clear();
      for(var chat in chatList){
        chatUsers.insert(0, ChatListModel(
            name: usersController.findUserById(chat['opponentId']).userName,
            // chat.get('user1')==FirebaseAuth.instance.currentUser!.uid? usersController.findUserById(chat.get('user2')).userName: usersController.findUserById(chat.get('user1')).userName,
            lastMessage: chat['lastMsg'],
            imageURL: '',
            time: "10.00 pm",
            userId: chat['opponentId'],
            ));
      }
    });




    
  }
}