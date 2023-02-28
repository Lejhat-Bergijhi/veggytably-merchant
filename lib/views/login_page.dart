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
            
              // logo
            //   Icon(Icons.lock, 
            //   size:100,
            // ),
            SizedBox(height: 100),

              // Text: VeggyMerch
              Text('VeggyMerch',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

              // Text: Powered by Veggytably
              Text('Powered by Veggytably',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                )
              ),
               SizedBox(height: 20),

            // Input Email or Telephone Number
            Container(
              width: 300,
              child: TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
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
              child: InputTextField(
                passwordController,
                'Password',
              ),
            ),
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
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),

                // Text: Don't have an account?
                Text('Don\'t have an account?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            
            SizedBox(height: 5),

            // Text: Sign Up
            GestureDetector(
              onTap: () {
                Get.offAll(() => SignUpPage(), transition: Transition.fade);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ])
        ),
      ));
  }
}
