import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/signup_page.dart';
import 'package:email_validator/email_validator.dart';

import '../controllers/auth_controller.dart';
import '../widgets/input_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
              child: Column(children: [
            SizedBox(height: 50),

            //logo
           Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/Group336.png',
                  width: 360.0,
                  height: 270.71,
                ),
              ),
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/Subtract.png',
                  width: 40.0,
                  height: 35.93,
                ),
              ),
            ),
            SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),

           Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please login to your account to continue',
                  style: TextStyle(
                    color: Color.fromARGB(131, 88, 83, 83),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Text:
            SizedBox(height: 16),

            // Input Email or Telephone Number
            Container(
              width: 300,
              child: TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => EmailValidator.validate(value!)
                    ? null
                    : "Please enter a valid email",
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Input Password
            Container(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Color.fromARGB(255, 171, 174, 171), 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )),
            SizedBox(height: 10),

            // Login button
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  authController.login(
                    emailController,
                    passwordController,
                  );
                  // emailController.clear();
                  // passwordController.clear();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),

            // Text: Don't have an account?
            SizedBox(
                width: 219,
                height: 21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    "New user? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                    ),
                  ),
                   GestureDetector(
                      onTap: () {
                        // Get.offAll(() => SignUpPage(), transition: Transition.fade);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff356631),
                          //underline
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ],)
            ),
            SizedBox(height: 5),

          ])),
        ));
  }
}
