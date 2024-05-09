
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Utilities/Validators/validation.dart';
import 'package:lets_chat/ViewModels/Auth_Controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Obx(
      () =>  Form(
        key: controller.signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter Your Full Name'
              ),
              validator: (value) => Validation.validateFullName(value),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
              ],
            ),

            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(label: Text('Email'), hintText: 'Enter your email ID'),
              validator: (value) => Validation.validateEmail(value),
            ),

            TextFormField(
              controller: controller.phoneNo,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                  label: Text('Mobile'),
                  hintText: 'Enter your contact number',
                  counterText: ''
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              validator: (value) => Validation.validateMobile(value),
            ),


            TextFormField(
              controller: controller.password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.showPassword.value ? false : true,
              decoration:  InputDecoration(labelText: 'Password', hintText: 'Enter password to secure',
                suffixIcon: IconButton(
                  icon:  Icon(controller.showPassword.value?Icons.visibility:Icons.visibility_off),
                  onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                ),

              ),
              validator: (value) => Validation.validatePassword(value),
            ),

            TextFormField(
              controller: controller.confirmPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.showConfirmPassword.value ? false : true,

              decoration: InputDecoration(labelText: 'Confirm Password', hintText: 'Re-enter password to verify',
                suffixIcon: IconButton(
                  icon:  Icon(controller.showConfirmPassword.value?Icons.visibility:Icons.visibility_off),
                  onPressed: () => controller.showConfirmPassword.value = !controller.showConfirmPassword.value,
                ),
              ),

              validator: (value) => Validation.validateConfirmPassword(value,controller.password.text),
            ),

          ]),
      ),
    );
  }
}