import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/ViewModels/Auth_Controllers/login_controller.dart';


import 'Components/login_form.dart';
import 'Components/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});


  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormHeaderWidget(image: 'assets/images/auth/login_header.png', title: "Let's Talk", subTitle: 'Get in touch'),
                  LoginFormWidget()
                ]
            ))
        // Obx(() {
        //   return const SingleChildScrollView(
        //       padding: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
        //       child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             FormHeaderWidget(image: 'assets/images/app_logo.png', title: 'FisherFolk', subTitle: 'Get a fresh fish'),
        //             LoginFormWidget()
        //           ]
        //       ));
        //   // if(loginController.loading.value){
        //   //   return Center(
        //   //     child: Column(
        //   //         mainAxisAlignment: MainAxisAlignment.center,
        //   //         crossAxisAlignment: CrossAxisAlignment.center,
        //   //         children: [
        //   //           Lottie.asset('assets/gif/Dolphin.json',
        //   //           width: screenSize.width * 0.5,
        //   //           ),
        //   //           const SizedBox(height: 30),
        //   //           const Text('Logging you in, just a moment!')
        //   //         ]),
        //   //   );
        //   // }else{
        //   //
        //   // }
        // })
      ),
    );
  }
}