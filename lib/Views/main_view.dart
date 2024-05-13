import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/ViewModels/bottombar_controller.dart';
import 'package:lets_chat/Views/BottombarView/ChatsList_View/chats_list_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarController = Get.put(BottomBarController());
    return Obx(
      () =>  Scaffold(
        body: bottomBarController.currentScreen,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomBarController.currentIndex.value,
          onTap: bottomBarController.changeSelectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
