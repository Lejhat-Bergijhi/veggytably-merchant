import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/login_page.dart';
import 'package:email_validator/email_validator.dart';

import '../controllers/auth_controller.dart';
import '../widgets/input_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthController authController = Get.put(AuthController());
  TextEditingController ownerUsernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController merchantUsernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 50),

            Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/Subtract.png',
                  width: 39.0,
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
                  'Sign Up',
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
                  'Manage your Bussiness Anywhere and Everywhere.',
                  style: TextStyle(
                    color: Color.fromARGB(206, 47, 47, 47),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'MERCHANT’S DATA',
                  style: TextStyle(
                    color: Color.fromARGB(131, 88, 83, 83),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Text:
            SizedBox(height: 10),

            //Input nama
            Container(
              width: 300,
              child: InputTextField(ownerUsernameController, "Name"),
            ),
            SizedBox(height: 10),

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

            //input no telp
            Container(
              width: 300,
              child: InputTextField(telephoneController, "Telephone Number"),
            ),
            SizedBox(height: 10),

            // Input Password
            Container(
              width: 300,
              child: Container(
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
              ),
              SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'RESTAURANT’S DATA',
                  style: TextStyle(
                    color: Color.fromARGB(131, 88, 83, 83),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Text:
            SizedBox(height: 10),

            Container(
              width: 300,
              child: InputTextField(
                merchantUsernameController,
                "Restaurant Name",
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              child: InputTextField(
                addressController,
                "Restaurant Address",
              ),
            ),
            SizedBox(height: 10),

            // signup button
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  authController.signUp(
                    ownerUsernameController,
                    emailController,
                    telephoneController,
                    passwordController,
                    merchantUsernameController,
                    addressController,
                  );
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 14,
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
            SizedBox(height: 10),

            SizedBox(
                width: 219,
                height: 21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    "Already have an account? ",
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
                        'Login',
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
          ]),
        ),
      ),
    );
  }
}
