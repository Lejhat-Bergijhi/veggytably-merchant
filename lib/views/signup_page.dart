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

            // Text: VegyMerch
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Text: Powered by Vegytably
            Text('Manage your Bussiness Anywhere and Everywhere.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),

            Text('Merchant’s Data',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10),

            //Input nama
            Container(
              width: 300,
              height: 45,
              child: InputTextField(ownerUsernameController, "Your Name",),
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
              height: 45,
              child: InputTextField(telephoneController, "Telephone Number",),
            ),
            SizedBox(height: 10),

            // Input Password
            Container(
              width: 300,
              height: 45,
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
                    ),
                  )),
            ),
            SizedBox(height: 20),

            Text('Restaurant’s Data',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10),

            Container(
              width: 300,
              height: 45,
              child: InputTextField(
                merchantUsernameController,
                "Restaurant Name",
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              height: 45,
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
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Text: Don't have an account?
            Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),

            // Text: login
            GestureDetector(
              onTap: () {
                Get.offAll(() => LoginPage(), transition: Transition.fade);
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  decorationThickness: 5,
                  decorationColor: Color.fromARGB(255, 1, 6, 3),
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
