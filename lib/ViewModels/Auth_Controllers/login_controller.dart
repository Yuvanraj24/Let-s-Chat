import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Firebase/Auth/auth_functions.dart';
import 'package:lets_chat/Views/Auth_View/Login/login_view.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  final loginFormKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  RxBool rxShowPassword = RxBool(false);
  get showPassword => rxShowPassword;

  RxBool loading = RxBool(false);

  login() async {
      if(loginFormKey.currentState!.validate()){
       try{
         loading.value = true;
         int authResponse = await firebaseAuthService.signIn(email.text, password.text);

         if(authResponse == 200){
           // Get.offAll(const BottomBarView());
           Get.showSnackbar(const GetSnackBar(
             backgroundColor: Colors.blueGrey,
             message: 'Login Success',
             duration: Duration(seconds: 1),
           ));
           email.clear();
           password.clear();
         }
         else if(authResponse == 400){
           Get.showSnackbar(const GetSnackBar(
             backgroundColor: Colors.blueGrey,
             message: 'Invalid user or password',
             duration: Duration(seconds: 1),
           ));
         }
         else{
           Get.showSnackbar(const GetSnackBar(
             backgroundColor: Colors.blueGrey,
             message: 'Login Failed',
             duration: Duration(seconds: 1),
           ));
         }
       }catch(e){
         e;
       }finally{
         Future.delayed(const Duration(seconds: 3),() {
           loading.value = false;
         });
       }
    }
  }


  logout() async {
    int authResponse = await firebaseAuthService.signOut();
    if(authResponse == 200){
      // final bottomBarController = Get.put(BottomBarController());
      // bottomBarController.bottomBarIndex.value = 0;
      Get.offAll(const LoginView());
    }
    else{
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: Colors.blueGrey,
        message: 'Unable to proceed',
        duration: Duration(seconds: 1),
      ));
    }
  }
}