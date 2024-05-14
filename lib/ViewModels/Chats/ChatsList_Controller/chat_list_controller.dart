import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Models/Chats/chat_list_model.dart';
import 'package:lets_chat/Utilities/utilities.dart';
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
      List chatList = chatsListSnapShot.get("opponentsId");
      chatUsers.clear();
      for(var chat in chatList){
        print('check id ---> $chat');
        print('check id 1 ---> ${chatsListSnapShot.get('$chat.lastMsg')}');
        chatUsers.insert(0, ChatListModel(
            name: usersController.findUserById(chat).userName,
            // chat.get('user1')==FirebaseAuth.instance.currentUser!.uid? usersController.findUserById(chat.get('user2')).userName: usersController.findUserById(chat.get('user1')).userName,
            lastMessage: chatsListSnapShot.get('$chat.lastMsg'),
            imageURL: '',
            time: Utilities.convertDateTimeToTime(chatsListSnapShot.get('$chat.lastMsgTime')),
            userId: chat,
            ));
      }
    });




    
  }
}