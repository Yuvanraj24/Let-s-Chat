
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/ViewModels/Auth_Controllers/signup_controller.dart';

import 'Components/signup_form.dart';
import 'Components/signup_header.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return   SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed:() => Get.back(), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          body: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            child: Column(
              children: [
                SignUpHeaderWidget(image: 'assets/images/app_logo.png', title: 'FisherFolk', subTitle: 'Get a fresh fish'),
                SignUpFormWidget(),
              ],
            ),
          ),
          bottomNavigationBar: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const ContinuousRectangleBorder(),
                  minimumSize: const Size(double.infinity, 50)
              ),
              onPressed: () => controller.signUp(), child:const Text('Sign Up',
            style: TextStyle(
                color: Colors.white
            ),
          )),
        );
        // if(controller.loading.value){
        //   return  Center(
        //       child: Lottie.asset('assets/gif/Dolphin.json'));
        // }
        // else{}
      }),
    );
  }
}
