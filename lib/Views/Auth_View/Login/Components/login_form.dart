import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_chat/Utilities/Validators/validation.dart';
import 'package:lets_chat/ViewModels/Auth_Controllers/login_controller.dart';
import 'package:lets_chat/Views/Auth_View/SignUp/signup_view.dart';


class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Email Field
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => Validation.validateEmail(value),
              decoration:
              const InputDecoration(labelText: 'Email', hintText: 'Enter Your Email'),
            ),

            /// -- Password Field
            Obx(
               () => TextFormField(
                controller: controller.password,
                 validator: (value) => Validation.validatePassword(value),
                obscureText: controller.showPassword.value ? false : true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  suffixIcon: IconButton(
                    icon:  Icon(controller.showPassword.value?Icons.visibility:Icons.visibility_off),
                    onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// -- FORGET PASSWORD BTN
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {} ,
                child: const Text('Forget Password?',
                  style: TextStyle(fontWeight: FontWeight.w600,
                    color: Colors.grey
                  ),
                ),
              ),
            ),

            ElevatedButton(
                onPressed: () => controller.login(),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  backgroundColor: Colors.blue.shade800,
                  minimumSize: const Size(double.infinity, 60)
                ),
                child: const Text('Login',
                style: TextStyle(color: Colors.white),
                )),

            /// -- Move to Sign Up BTN
            TextButton(onPressed: () => Get.to(() => const SignUpView()), child:  RichText( text: const TextSpan(
              text: 'Not Registered?  ',
              style: TextStyle(
                color: Colors.grey
              ),
              children: [
                TextSpan(text: 'Sign up', style: TextStyle(
                    fontWeight: FontWeight.bold,
                ))
              ]
            ))),

          ]),
      ),
    );
  }
}