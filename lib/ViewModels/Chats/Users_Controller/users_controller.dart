import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Models/Chats/chat_list_model.dart';

class UsersController extends GetxController {

  final RxList<UserModel> usersList = RxList([]);


  UserModel findUserById(String userId){

    print(usersList.length);
    print(usersList);
    print('find user id --> $userId');
    print('find user id input --> $userId');
    UserModel userModel =  usersList.firstWhere((element) => element.userId == userId);
    print('user mo : ${userModel.userId}');
    print('user mo name : ${userModel.userName}');
    return userModel;
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   try{
     FirebaseFirestore.instance.collection('users').snapshots().listen((usersSnapshot) {
       usersList.clear();
       for(var user in usersSnapshot.docs){
         usersList.insert(0, UserModel(userName: user.get('name'), userMail: user.get('email'), userId: user.get('id')));
       }
       print('user list ---> $usersList');
     });
   } catch(e){
     e;
   }
  }
}