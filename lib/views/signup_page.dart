import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/controllers/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController signUpController = Get.put(SignUpController());

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
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 40),

            Text('Owner’s Data',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),

            //Input nama
            Container(
              width: 300,
              child: TextField(
                controller: signUpController.usernameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Input Email or Telephone Number
            Container(
              width: 300,
              child: TextField(
                controller: signUpController.emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
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
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Telephone Number',
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
                controller: signUpController.passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Login button
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  signUpController.signUp();
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
            SizedBox(height: 50),

            // Text: Don't have an account?
            Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),

            // Text: Sign Up
            Text(
              'Login',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
