import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/ViewModels/Auth_Controllers/login_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return SafeArea(
        child: Scaffold(
          body: Column(
        children: [
          ListTile(leading: const Icon(Icons.logout),
          title: const Text("Log-out"),
            onTap: () => loginController.logout(),

          )
        ]),
    ));
  }
}
