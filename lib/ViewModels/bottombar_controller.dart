import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Views/BottombarView/ChatsList_View/chats_list_view.dart';
import 'package:lets_chat/Views/BottombarView/Profile/profile_view.dart';

class BottomBarController extends GetxController {
  static BottomBarController get instance => Get.find();

  final currentIndex = 0.obs;

  List<Widget> bottomBarBody = [
    const ChatsListView(),
    const ProfileView()
  ];

  Widget get currentScreen => bottomBarBody[currentIndex.value];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  void changeSelectedIndex(int index){
    currentIndex.value = index;
  }
}