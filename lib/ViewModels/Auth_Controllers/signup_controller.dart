
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Firebase/Auth/auth_functions.dart';
import 'package:lets_chat/Views/main_view.dart';



class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final signUpFormKey = GlobalKey<FormState>();


  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  RxBool rxShowPassword = RxBool(false);
  get showPassword => rxShowPassword;

  RxBool rxShowConfirmPassword = RxBool(false);
  get showConfirmPassword => rxShowPassword;

  RxBool loading = RxBool(false);

  signUp() async {
    if(signUpFormKey.currentState!.validate()){
      try{
        int authResponse = await firebaseAuthService.registerUser(fullName.text, email.text, phoneNo.text, password.text);

        if(authResponse == 200){
          Get.offAll(const MainView());
          Get.showSnackbar(const GetSnackBar(
            backgroundColor: Colors.blueGrey,
            message: 'Sign up Success',
            duration: Duration(seconds: 1),
          ));
          fullName.clear();
          email.clear();
          phoneNo.clear();
          password.clear();
          confirmPassword.clear();
        }
        else if(authResponse == 400){

          Get.showSnackbar(const GetSnackBar(
            backgroundColor: Colors.blueGrey,
            message: 'Email is already exist',
            duration: Duration(seconds: 1),
          ));

        }
        else{
          Get.showSnackbar(const GetSnackBar(
            backgroundColor: Colors.blueGrey,
            message: 'Sign up Failed',
            duration: Duration(seconds: 1),
          ));

        }
      } catch(e){
        e;
      }
      finally{
        Future.delayed(const Duration(seconds: 3),() {
          loading.value = false;
        });
      }
    }
  }

}